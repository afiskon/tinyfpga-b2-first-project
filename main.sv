/* vim: set ai et ts=4 sw=4: */
`default_nettype none

module top(input logic clk, output logic pin13);
    logic [24:0] divider = 0;
    logic led_state = 1;
   
    always @(posedge clk)
    begin
        if(divider == 8000000) 
        begin
            divider <= 0;
            led_state <= !led_state;
        end
        else 
            divider <= divider + 1;
    end
    assign pin13 = led_state;
endmodule
