clear
function [x,deltax]=gauss_seidel(A,b,x,tol,N)
/**
 * A  : Matriz de coeficientes
 * b  : Vetor coluna (deve ser passado transposto', geralmete tudo [1 1 ... 1]')
 * x  : Vetor coluna de chute (Geralmente [0 0 ... 0]')
 * tol: tolerancia
 * N  : Numero maximo de iteracoes
 */
 
n = size(A,1) // pega tamanho da matriz
xnew = x // pra ter o tamanho correta de coluna
convergiu = %F // falso

k = 1
while k<=N & ~convergiu
    xnew(1) = (b(1)-A(1,2:n)*x(2:n)) / A(1,1)
    for i=2:n-1
        xnew(i)=(b(i) -A(i,1:i-1)*xnew(1:i-1)...
                      -A(i,i+1:n)*x(i+1:n) ) / A(i,i)
    end
    xnew(n)=(b(n) - A(n,1:n-1)*xnew(1:n-1) ) / A(n,n)
    
    deltax = max(abs(x-xnew))
    if deltax<tol then
        convergiu = %T // true
    end
    k = k+1 // k: indice da iteracao
    x = xnew // atualiza x
    disp([k,x']) // debug -> x e' o vetor resposta
end
if ~convergiu then
    error('Nao convergiu')
end
endfunction
