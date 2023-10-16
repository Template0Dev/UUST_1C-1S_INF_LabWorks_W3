matrix = [20, -2, 4; 30, 0, 5; 2, -6, 5];
roam_values = [3; 4; 5];

determinant = det(matrix)
printf('Определитель матрицы: %d.\n', determinant);

if determinant != 0
    inverted_matrix = inv(matrix);
    results = inverted_matrix * roam_values;

    printf('Получено результатов: %d.\n', length(results));
    for i = 1:length(results)
        printf('\tКорень X%d: %1.2f.\n', i, results(i));
    end
else
    printf('Определитель равен 0, следовательно вычисление невозможно.');
end
