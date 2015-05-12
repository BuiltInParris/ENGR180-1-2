function sumAnswer = matrixAdder(X, Y, M, D)
randomMatrix = M + D*randn(X, Y);
placeholder = sum(randomMatrix,2);
sumAnswer = sum(placeholder);
end