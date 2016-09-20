#!/usr/bin/env ruby

=begin
	 Abordamos el problema de las torres de Hanoi con recursividad
=end

def solve_hanoi(disco, desde, hasta, aux, &block)
	if disco == 1 
		yield(disco, desde, hasta)
		return
	end
	solve_hanoi(disco-1, desde, aux, hasta, &block)
	yield(disco, desde, hasta)
	solve_hanoi(disco-1, aux, hasta, desde, &block)
end

if ARGV.count != 1
	puts "Se necesita un argumento numerico (La cantidad de discos)"
	exit
end

solve_hanoi(ARGV[0].to_i, 'A', 'C', 'B') { |disco, desde, hasta| puts "Mover #{disco} desde #{desde} hasta #{hasta}"}
