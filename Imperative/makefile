CC=gcc 
CFLAGS=-Wall -Wextra # compiler flags, troque o que quiser, exceto bibliotecas externas
EXEC=./nqueens # nome do executavel que sera gerado, nao troque
TMPOUT=nqueens.testresult

$(EXEC): nqueens.c 
	$(CC) $(CFLAGS) nqueens.c  -o $(EXEC)

clean:
	rm -rf nqueens