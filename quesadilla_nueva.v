// quesadilla.v
// Descripcion: Modulo principal que integra el PC, el sumador y la memoria de instrucciones
// para implementar el ciclo de Fetch.
`timescale 1ns / 1ps

module Quesadilla (
    input wire clk,   // Reloj principal
    input wire reset, // Señal de reinicio

    // Salidas para observacion en el testbench
    output wire [31:0] current_pc_out,    // Direccion actual que sale del PC
    output wire [31:0] next_pc_out,       // Direccion siguiente calculada por el sumador
    output wire [31:0] instruction_out   // Instruccion leida desde la memoria
);

    // Cables internos para conectar los modulos
    wire [31:0] C1; // Salida del PC -> entrada del sumador y direccion a memoria
    wire [31:0] C2; // Salida del sumador -> entrada del PC

    // 1. Instanciacion del Program Counter (PC)
    PC mi_pc (
        .clk(clk),
        .reset(reset),
        .next_pc(C2),      // El PC se actualizara con la salida del sumador
        .current_pc(C1)    // La salida actual del PC
    );

    // 2. Instanciacion del Sumador (+4)
    Adder4 mi_sumador (
        .pc_in(C1),        // El sumador toma la direccion actual del PC
        .pc_out(C2)        // y calcula la siguiente direccion
    );

    // 3. Instanciacion de la Memoria de Instrucciones
    // La memoria es de 16 palabras (64 bytes). La direccion de palabra (0 a 15)
    // se obtiene tomando los bits [5:2] de la direccion de byte del PC.
    memInstrucciones mi_memoria (
        .address(C1[5:2]),
        .instruction(instruction_out)
    );

    // Asignar las salidas del modulo principal para el testbench
    assign current_pc_out = C1;
    assign next_pc_out = C2;

endmodule
