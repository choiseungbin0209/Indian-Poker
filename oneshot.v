`timescale 1ns / 1ps

module oneshot(
    input clk,button,
    output reg tbutton
    );
    reg button_delayed;
    always@(posedge clk) begin
        if(button && !button_delayed) tbutton<= 1'b1;
        else tbutton<=1'b0;
        button_delayed <= button;
    end
endmodule
