// PC.v
// Descripcion: Contador de programa (PC) de 32 bits.
// Se actualiza en cada flanco de subida del reloj.
// Se resetea a 0 de forma sincrona.
`timescale 1ns / 1ps

module PC (
    input wire clk,          // Reloj
    input wire reset,        // Señal de reinicio
    input wire [31:0] next_pc, // Siguiente valor del PC (viene del sumador)
    output reg [31:0] current_pc // Valor actual del PC
);

    // Comportamiento del PC
    always @(posedge clk) begin
        if (reset) begin
            // Si reset está activo, el PC se inicializa en 0.
            current_pc <= 32'h00000000;
        end else begin
            // En cada ciclo de reloj, el PC toma el valor calculado por el sumador.
            current_pc <= next_pc;
        end
    end

endmodule
