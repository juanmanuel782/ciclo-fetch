// Quesadilla_tb.v
// Descripcion: Testbench para verificar el funcionamiento del modulo Quesadilla.
`timescale 1ns / 1ps

module Quesadilla_tb;

    // Entradas para el modulo Quesadilla
    reg clk;
    reg reset;

    // Salidas del modulo Quesadilla
    wire [31:0] current_pc_out;
    wire [31:0] next_pc_out;
    wire [31:0] instruction_out;

    // Instanciacion del modulo a probar (DUT - Device Under Test)
    Quesadilla dut (
        .clk(clk),
        .reset(reset),
        .current_pc_out(current_pc_out),
        .next_pc_out(next_pc_out),
        .instruction_out(instruction_out)
    );

    // Generacion de la señal de reloj (cada 5ns cambia de valor)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Secuencia de estimulos para la simulacion
    initial begin
        // 1. Aplicar un reset inicial para asegurar un estado conocido (PC=0)
        reset = 1;
        $display("Tiempo=%0t | RESET APLICADO | PC Reiniciado a 0", $time);
        #10; // Mantener el reset por 10ns

        // 2. Liberar el reset para que el procesador comience a buscar instrucciones
        reset = 0;
        $display("Tiempo=%0t | RESET LIBERADO  | Inicia la ejecucion del ciclo Fetch", $time);

        // 3. Dejar que la simulacion corra por varios ciclos para ver el funcionamiento
        #100;

        // 4. Terminar la simulacion
        $display("Tiempo=%0t | FIN DE LA SIMULACION", $time);
        $finish;
    end

    // Monitoreo de las señales importantes en cada ciclo de reloj
    always @(posedge clk) begin
        if (!reset) begin
            $display("Tiempo=%0t | PC_Actual: 0x%h | PC_Siguiente: 0x%h | Instruccion: 0x%h",
                     $time, current_pc_out, next_pc_out, instruction_out);
        end
    end

endmodule
