module modified_booth_multiplier(
  input [15:0] multiplicand,  // 16-bit multiplicand
  input [15:0] multiplier,    // 16-bit multiplier
  output [31:0] product       // 32-bit product
);

  wire [31:0] result;
  wire [2:0] control;
  wire [15:0] multi_reg;
  wire [15:0] booth_encoded;

  // Register to hold the multiplier (right-shifting)
  always @(posedge clk or posedge rst) begin
    if (rst)
      multi_reg <= 16'b0;
    else if (shift_enable)
      multi_reg <= {multi_reg[14:0], multiplier[15]};
  end

  // Booth Encoding
  always @* begin
    booth_encoded = {multi_reg[15], multi_reg[14:0], multi_reg[15]} ^ multi_reg;
  end

  // Booth Encoding to Control Signal
  always @* begin
    case(booth_encoded)
      3'b000: control = 3'b000;
      3'b001: control = 3'b001;
      3'b010: control = 3'b001;
      3'b011: control = 3'b000;
      3'b100: control = 3'b010;
      3'b101: control = 3'b010;
      3'b110: control = 3'b011;
      3'b111: control = 3'b000;
    endcase
  end

  // Product Calculation
  always @(posedge clk or posedge rst) begin
    if (rst)
      result <= 32'b0;
    else if (multiply_enable) begin
      case(control)
        3'b000: result <= result;
        3'b001: result <= result + {16'b0, multiplicand};
        3'b010: result <= result + {16'b0, -multiplicand};
        3'b011: result <= result;
        3'b100: result <= result + {16'b0, multiplicand};
        3'b101: result <= result;
        3'b110: result <= result;
        3'b111: result <= result;
      endcase
    end
  end

  assign product = result;

endmodule
