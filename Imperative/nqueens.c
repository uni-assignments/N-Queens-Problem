#include "stdio.h"
#include "stdlib.h"
#define N 4

int solucao_valida(int *linhas, int linha, int coluna){
    if (coluna == 0)
        return 1;
    for (int i = 0; i < coluna; i++) if ((linhas[i] == linha + coluna - i) || (linhas[i] == linha - coluna + i) || (linhas[i] == linha)){
        return 0;
    }

    return 1;
}

void imprime_solucao(int *linhas) {

    printf("\n----------------\n");
    for (int i = 0; i < N; i++){
        for (int j = 0; j < N; j++){
            if(j == linhas[i]) printf("| R ");
            else printf("|   ");
        }
        printf("|\n----------------\n");
    }
}
 
void ndamas(int *linhas, int y){
    for (int i = 0; i < N; i++) if (solucao_valida(linhas, i, y)) {
        linhas[y] = i;
        if (y == N-1) imprime_solucao(linhas);
        else ndamas(linhas, y+1);
    }
}

int main (){
    
    int *linhas = (int *) calloc(N, sizeof(int));
    printf("\nSoluções:\n");
    ndamas(linhas,0);
    
    free(linhas); 
    return 0;
}