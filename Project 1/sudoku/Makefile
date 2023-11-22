
gcc_serial: sudoku_solver.c
	gcc -o sudoku_solver_serial sudoku_solver.c -fopenmp -lm
run_serial: gcc_serial
	./sudoku_solver_serial 16 grids/4x4_easy.csv


gcc_b: sudoku_solver_b.c
	gcc -o sudoku_solver_parallel_b sudoku_solver_b.c -fopenmp -lm
run_b: gcc_b
	./sudoku_solver_parallel_b 16 grids/4x4_easy.csv


gcc_c: sudoku_solver_c.c
	gcc -o sudoku_solver_parallel_c sudoku_solver_c.c -fopenmp -lm
run_c: gcc_c
	./sudoku_solver_parallel_c 16 grids/4x4_easy.csv


clean:
	rm -f sudoku_solver