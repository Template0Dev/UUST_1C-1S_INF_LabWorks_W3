// This function calculates polynomial points of the given data set by specified polynomial degree.
function coefficients = polyfit(x_set, y_set, polynomial_degree)
    // 'Ones' function creates a vector with '1' values by given length. 
    // First element (this leads to +1) is the constant of the polynomial.
    blank_matrix = ones(length(x_set), polynomial_degree + 1);
    for i = 1:polynomial_degree
        // Here, we take a 'i+1' element FROM 'blank_matrix' and then, 
        // we SET it to corresponding 'x_set' element, raised to 'i' degree.
        blank_matrix(:, i + 1) = x_set(:).^i
    end

    // 'Lsq' function calculates least squares regression (minimal negative accumulation) 
    // by 'blank_matrix' and set it to 'y_set', and then returns coefficients.
    coefficients = lsq(blank_matrix, y_set(:));
endfunction

// Here we set a constant polynomial degree. This one is used in all calculations.
polynomial_degree = 4;

// Values from the exercise, and then coefficients from the 'polyfit' function.
x_set = [0.0000, 0.1000, 0.2000, 0.3000, 0.4000, 0.5000, 00.6000, 00.7000, 00.8000, 00.9000, 01.0000];
y_set = [3.0020, 3.5345, 4.0000, 5.3420, 5.7000, 9.5123, 10.6350, 12.9100, 14.5656, 14.8010, 17.0000];
coefficients = polyfit(x_set, y_set, polynomial_degree);

// Iterate and show the coefficients (except the first one, because this is the polynomial constant).
printf('Коэффициенты:\n');
for i = 2:length(coefficients)
    printf('\tКоэффициент %d: %1.5f.\n', i - 1, coefficients(i));
end

// 'Linspace' function creates a linear vector with the range from MINIMAL 'x_set' to MAXIMAL 'y_set'. Like 'range' in Python.
linear_vector = linspace(min(x_set), max(x_set));
// This is similar to the 3 line. Here we also make a blank (with '1') vector.
blank_matrix = ones(length(linear_vector), polynomial_degree + 1);
for i = 1:polynomial_degree
    // Here we set the values. 'i + 1' value in 'blank_matrix' will be replaced by corresponding 'linear_vector' value with power 'i'.
    blank_matrix(:, i + 1) = linear_vector.^i;
end

y_iterator = 1;
final_offset_sum = 0;

printf('\nОтклонения точек:\n');
for i = 0.0 : 0.1 : 1.0
    polynomial_value = coefficients(2) + coefficients(3) * i + coefficients(4) * i^2 + coefficients(5) * i^3;
    offset = y_set(y_iterator) - polynomial_value;

    printf('\tОтклонения в точке №%d: %1.5f.\n', y_iterator, offset);

    final_offset_sum = final_offset_sum + offset;
    y_iterator = y_iterator + 1;
end

printf('\nСумма квадратов отклонения: %1.5f.\n', final_offset_sum / 100);

// And here we just build the plots.
xgrid();
xtitle('График Функции', 'X', 'Y');

a = gca();
a.x_location = 'origin';
a.y_location = 'origin';

plot(x_set, y_set, 'rx');
plot(linear_vector, blank_matrix * coefficients);
