#include "stdio.h"
#include "stdlib.h"
#define N 4

int is_valid(int **board, int row, int col){
//como a cada item percorremos uma coluna, só precisamos verificar a linha e as diagonais
    int i, j;
    
    for (i = 0; i < N; i++) if(board[row][i]){ //linha
        return 0;
    }
    for (i = row, j = col; i >= 0 && j >= 0; i--, j--) if(board[i][j]){ //diagonal inferior esquerda - superior direita
        return 0;
    }
    for (i = row, j = col; j >= 0 && i < N; i++, j--) if(board[i][j]){ // //diagonal superior esquerda - inferior direita
        return 0;
    }
    
    return 1;
}
int theres_solution(int **board, int col){
    if(col >= N) //Significa que já percorremos o tabuleiro todo e colocamos N rainhas
        return 1;
    for (int i = 0; i < N; i++){ //Para cada linha
        if(is_valid(board, i, col)){ //Se podemos colocar uma rainha ali
            board[i][col] = 1;
            if(theres_solution(board, col + 1)){ //Se ainda conseguimos alcancar uma solucao daqui, continuamos
                return 1;
            } 
            else {
                board[i][col] = 0; //Caso contrário tentaremos com a próxima linha
            }
        }
    }
    
    return 0; //Caso nenhuma linha funcione não existe solução
}

void print_solution(int **board){
    printf("\nSolução:\n");        
    for (size_t i = 0; i < N; i++){
        for (size_t j = 0; j < N; j++){
            printf("%d", board[i][j]);
        }
        printf("\n");        
    }
}

void free_board(int **board){
    for (size_t j = 0; j < N; j++)
        free(board[j]);
    
    free(board);
}


int main (){

    int **board = (int **) calloc(N, sizeof(int*));
    for (size_t i = 0; i < N; i++) 
        board[i] = (int*) calloc (N,sizeof(int));
        
    if (!theres_solution(board, 0))
        printf("\nNao existe uma solucao!\n");
    else 
        print_solution(board);
    
    free_board(board);

    return 0;
}