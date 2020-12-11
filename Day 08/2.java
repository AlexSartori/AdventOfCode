package day8;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;


public class Day8 {

    static class Instruction {
        String inst;
        int val;
        Boolean visited;

        public Instruction(String line) {
            String[] v = line.split(" ");
            this.inst = v[0];
            this.val = Integer.parseInt(v[1]);
            this.visited = false;
        }
    }


    private static Boolean try_program(ArrayList<Instruction> program) {
        int accumulator = 0;
        int i = 0;

        while (i < program.size()) {
            Instruction inst = program.get(i);

            if (inst.visited)
                return false;

            switch (inst.inst) {
                case "acc":
                    accumulator += inst.val;
                    i++;
                    break;
                case "jmp":
                    i += inst.val;
                    break;
                default:
                    i++;
                    break;
            }

            inst.visited = true;
        }

        System.out.println("Accumulator: " + accumulator);
        return true;
    }


    public static void main(String[] args) {
        ArrayList<Instruction> program = new ArrayList<>();

        try {
            File f = new File("/home/alex/Code/AdventOfCode/Day 8/input");
            Scanner s = new Scanner(f);
            while (s.hasNextLine())
                program.add(
                    new Instruction(s.nextLine())
                );
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

        for (int i = 0; i < program.size(); i++) {
            Instruction inst = program.get(i);

            if (inst.inst.equals("acc"))
                continue;

            if (inst.inst.equals("jmp"))
                inst.inst = "nop";
            else if (inst.inst.equals("nop"))
                inst.inst = "jmp";

            if (try_program(program))
                return;

            // Reset program
            for (int j = 0; j < program.size(); j++)
                program.get(j).visited = false;
            if (inst.inst.equals("jmp"))
                inst.inst = "nop";
            else if (inst.inst.equals("nop"))
                inst.inst = "jmp";
        }
    }
}
