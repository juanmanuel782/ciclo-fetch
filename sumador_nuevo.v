// adder4.v
// Descripcion: Sumador que incrementa una direccion de 32 bits en 4.
`timescale 1ns / 1ps

module Adder4 (
    input wire [31:0] pc_in,    // Entrada: PC actual
    output wire [31:0] pc_out  // Salida: PC + 4
);

    // Realiza la suma PC + 4 de forma combinacional.
    // Esto prepara la direccion de la siguiente instruccion.
    assign pc_out = pc_in + 32'd4;

endmodule
