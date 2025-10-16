// memInstrucciones.v
// Descripcion: Memoria de Instrucciones tipo ROM de 16x32 bits.
// Carga las instrucciones desde un archivo externo en formato hexadecimal.
`timescale 1ns / 1ps

module memInstrucciones (
    input wire [3:0] address,       // Direccion de palabra (PC[5:2])
    output wire [31:0] instruction  // Instruccion de 32 bits leida
);

    // Memoria interna: 16 registros de 32 bits cada uno (64 bytes en total).
    reg [31:0] memory [0:15];

    // Bloque inicial para cargar el contenido de la memoria desde un archivo.
    initial begin
        $readmemh("instructions.hex", memory);
    end

    // Lectura combinacional de la memoria.
    // La 'address' ya es la direccion de palabra, por lo que se usa directamente.
    assign instruction = memory[address];

endmodule
