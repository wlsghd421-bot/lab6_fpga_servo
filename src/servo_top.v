`timescale 1ns/1ps
module servo_top(
    input wire clk_50mhz, rst_p,
    input wire key_left, key_right,
    output wire servo,
    output wire [3:0] led
);
    wire left_pulse, right_pulse;
    button_onepulse u_left(.clk(clk_50mhz), .rst_p(rst_p), .button(key_left), .pulse(left_pulse));
    button_onepulse u_right(.clk(clk_50mhz), .rst_p(rst_p), .button(key_right), .pulse(right_pulse));
    servo_ctrl u_servo(clk_50mhz, rst_p, left_pulse, right_pulse, servo);
    assign led = {servo, rst_p, key_right, key_left};
endmodule