`timescale 1ns / 1ps

module simpleCNN (
	CLK,
	nRST,
	START,
	X,
	Y,
	IMGIN,
	
	DONE,
	OUT
);

	input			CLK;
	input			nRST;
	input			START;
	input	[4:0]	X;
	input	[4:0]	Y;
	input	[199:0]	IMGIN;
	
	output			DONE;
	output	[3:0]	OUT;

    reg             DONE;
    reg     [3:0]   OUT;

    `include "kernel.vh"

parameter s0 = 2'd0,
          s1 = 2'd1,
          s2 = 2'd2,
          s3 = 2'd3;

integer conv_output [23:0][23:0];
integer relu_output [575:0];
integer fc_output[9:0];
reg signed [7:0] CV_kernel;
reg signed [7:0] FC_kernel;
reg [3:0] temp_out;
reg [2:0] state;
reg [2:0] next_state;
integer output_fc;
integer cv_done, fc_done, out_done;
integer i, j, q, e, t;
integer st;

always @ (posedge CLK)
begin
    if(!nRST)
        st <= 0;
    if(START)
        st <= 1;
    if(nRST && st == 1)
        state <= next_state;
    else
        state <= s0;
end

always @ (state or st)
begin
    case (state)
        s0: if(st)
            begin
                next_state = s1;
            end
            else
                next_state = s0;
        s1: begin
                DONE = 1'b0;
                cv_done = 0;
                fc_done = 0;
                out_done = 0;
                OUT = 0;
                while (cv_done != 1)
                @(Y) begin
                    conv_output[Y][X] = 0;
                    relu_output[Y * 24 + X] = 0; 
                    for(i = 0;i < 5; i = i + 1)
                    begin
                        for(j = 0; j < 5; j = j + 1)
                        begin
                            CV_kernel = conv_kernel(i, j);
                            conv_output[Y][X] = conv_output[Y][X] + CV_kernel * IMGIN[199 - 8 * j - 40 * i -:8];
                        end                    
                    end
                    if (conv_output[Y][X] < 0)
                        relu_output[Y * 24 + X] = 0;
                    else
                        relu_output[Y * 24 + X] = conv_output[Y][X];
                    if ( X == 23 && Y == 23)
                        cv_done = 1;
                    end
                next_state = s2;
            end
        s2: begin 
                if (fc_done != 1)
                begin
                    for(q = 0; q < 10; q = q + 1)
                    begin
                        fc_output[q] = 0;
                        for(e = 0; e < 576; e = e + 1)
                        begin
                            FC_kernel = fc_kernel(q, e);
                            fc_output[q] = fc_output[q] + relu_output[e] * FC_kernel;
                        end
                    end
                    fc_done = 1;
                end
                if (out_done != 1)
                begin
                    temp_out = 0;
                    output_fc = fc_output[0];
                    for(t = 1; t < 10; t = t + 1)
                    begin
                        if(output_fc < fc_output[t])
                        begin
                            output_fc = fc_output[t];
                            temp_out = t;
                        end
                    end     
                    out_done = 1;
                end
                next_state = s3;
            end
        s3: begin
                DONE = 1'b1;
                OUT = temp_out;
                next_state = s1;
            end
        default: next_state = s0;
    endcase
end

endmodule
