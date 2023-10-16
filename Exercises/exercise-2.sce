function complete_as_common_equaltion()
    printf('Вычисление как Уравнение:');

    x_coordinates, y_coordinates = get_the_coordinates();
    build_plot(x_coordinates, y_coordinates);

    // Now solve the roots value.
    result = fsolve([-0.25, 0.25], calculate_equation);

    // And then show it on the console.
    printf('\tНайдено два корня!\n')
    printf('\t\tX1 = %1.5f.\n', result(1));
    printf('\t\tX2 = %1.5f.', result(2));
endfunction

// This generates and returns the coordinates of the plot.
function [x_coordinates, y_coordinates] = get_the_coordinates()
    // Take the original coordinates (in [-100; 100] range, to cover all roots).
    x_coordinates = -100:0.01:100;
    y_coordinates = calculate_equation(x_coordinates);
endfunction

// Function to caclulate the 'Y' coordinate.
function result = calculate_equation(x)
    result = (2 * x ^ 4) - (18 * x ^ 3) + (8 * x ^ 2) - 1;
endfunction

// This one is builds the plot itself.
function build_plot(x, y)
    a = gca();
    a.x_location = 'origin';
    a.y_location = 'origin';
    xgrid();
    xtitle('График Функции', 'X', 'Y');

    plot(x, y);
endfunction

function complete_as_polynomical_equation()
    printf('Вычисление как Полином:\n');

    // Create the vector from the original equaltion (should be written in reverse order).
    vector = [-1 0 8 -18 2];
    // Create polynom from the vector (with 'X' as variable, and coefficients as results ('c' as third argument)).
    polynom = poly(vector, 'x', 'c');
    // Then just find the roots of the equation.
    results = roots(polynom);

    // Set plot values and build the plot.
    arguments_vector = [-100:0.25:100];
    values_vector = calculate_equation(arguments_vector);
    build_plot(arguments_vector, values_vector);

    // Show final results (roots).
    printf('\tКоличество найденных корней: %d.\n', length(results));
    for i = 1:length(results)
        printf('\t\tКорень %d: %1.5f.\n', i, results(i));
    end
endfunction

complete_as_polynomical_equation();
