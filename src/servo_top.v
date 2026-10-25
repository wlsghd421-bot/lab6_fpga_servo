`timescale 1ns/1ps
// 보드 버튼 KEY01(왼쪽), KEY02(오른쪽)을 한 클록 펄스로 바꾸어 servo_ctrl에 연결합니다.
module servo_top(
    input wire clk_50mhz, rst_p,
    input wire key_left, key_right,
    output wire servo
);
    wire left_pulse, right_pulse;
    button_onepulse u_left(.clk(clk_50mhz), .rst_p(rst_p), .button(key_left), .pulse(left_pulse));
    button_onepulse u_right(.clk(clk_50mhz), .rst_p(rst_p), .button(key_right), .pulse(right_pulse));
    servo_ctrl u_servo(clk_50mhz, rst_p, left_pulse, right_pulse, servo);
endmodule