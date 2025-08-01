//module Name : SPI_Slave
//module Version : 1
//Date : 2025 - 7 - 31 
//Author : 

module SPI_Slave
    #(parameter IDLE = 3'b000, CHK_CMD = 3'b001, WRITE = 3'b010, 
    READ_ADD = 3'b011, CHK_ = 3'b100)(
    input clk, rst_n, SS_n, MOSI, tx_valid,
    input [7:0] tx_data,
    output [9:0] rx_data,
    output rx_valid, MISO
    );
    
    reg [2:0] cs, ns;
    
    
    
    
    // state memory logic
    always@(posedge clk)
    begin
    if (!rst_n)
        cs <= IDLE;
    else
        cs <= ns;
    end
    
    //next state logic
    always@(cs)
    begin
        case(cs)
            IDLE: ns = (SS_n)? cs : CHK_CMD;
            CHK_CMD: begin
                if(!SS_n && !MOSI)
                    ns = WRITE;
                else if (SS_n)
                    ns = IDLE;
                //mising
            end
            WRITE: 
        
                
        endcase
    end
    
endmodule