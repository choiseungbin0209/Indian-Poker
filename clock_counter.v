`timescale 1ns / 1ps

module clk_counter(
    input clk,
    input [2:0] state,
    output [26:0] count,
    output [3:0] iter,
    output reg blink,fast_blink
    );
    reg[26:0] cnt=27'd0;
    reg[3:0] random_cnt=4'd0;
    always@(posedge clk) begin
        if(cnt < 27'd100000000) begin
            cnt <= cnt + 1;
        end else begin
            cnt <= 0;
        end
    end
    always@(posedge clk) begin
        if(cnt < 27'd50000000) begin
            blink <=0;
        end else begin
            blink <=1;
        end
    end
    always@(posedge clk) begin
        if(cnt < 27'd25000000) begin
            fast_blink <=0;
        end else if(cnt >= 27'd25000000 && cnt < 27'd50000000)begin
            fast_blink <= 1;
        end else if(cnt >= 27'd50000000 && cnt < 27'd75000000)begin
            fast_blink <= 0;
        end else if(cnt >= 27'd75000000 && cnt < 27'd100000000)begin
            fast_blink <= 1;
        end else begin
            fast_blink <= 0;
        end
    end
    
    
    assign count = cnt[26:0];
    assign iter = cnt[15:12];
    assign rand_num = random_cnt;
    
endmodule
