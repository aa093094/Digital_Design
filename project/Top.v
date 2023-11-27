`timescale 1ns / 1ps

module Top;

reg clk, nrst, start;
reg [4:0] x, y;
reg [199:0] imgin;

wire done;
wire [3:0] out;

reg [0:6271] image_mem [99:0];
reg [0:3] label_mem [99:0];

integer image_cnt;
integer co_cnt;
integer on;

initial
begin
    clk = 1'd0;
    forever #5 clk = ~clk;
end

simpleCNN CNN(.CLK(clk), .nRST(nrst), .START(start), .X(x), .Y(y), .IMGIN(imgin), .DONE(done), .OUT(out));

initial
begin
    $readmemh("image.mem", image_mem);
    $readmemh("label.mem", label_mem);
    co_cnt = 0;
    #10 nrst = 1; 
    #10 start = 1;
    if (start)
    begin
        #10 start = 0;
        for (image_cnt = 0; image_cnt < 100; image_cnt = image_cnt + 1)
        begin
            on = 0;
            for(x = 0; x < 24; x = x + 1)
            begin
                for(y = 0; y < 24; y = y + 1)
                begin
                    imgin[199:0] = {image_mem[image_cnt][x * 8 + y * 224+:40], image_mem[image_cnt][x * 8 + (y + 1) * 224+:40], image_mem[image_cnt][x * 8 + (y + 2) * 224+:40], image_mem[image_cnt][x * 8 + (y + 3) * 224+:40], image_mem[image_cnt][x * 8 + (y + 4) * 224+:40]};    
                    #10 ;
                end
            end
            #10
            while(on != 1)
            begin
                if(done && out == label_mem[image_cnt])
                begin
                    co_cnt = co_cnt + 1;
                    on = 1;
                end
                else if(done && out != label_mem[image_cnt])
                    on = 1;
            end
            #10 ;
        end
    end
    #10 $finish;
end

initial
    $monitor($time, " image_cnt = %d, out = %d, co_cnt = %d ", image_cnt, out, co_cnt);

endmodule
