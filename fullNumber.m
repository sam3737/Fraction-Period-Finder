% A full accuracy number expressed as both a fraction and decimal
classdef fullNumber

    properties
        % Fraction data
        numerator
        denominator

        % Decimal data
        base
        period
    end
    
    methods
        % Constructor
        function obj = fullNumber(a, b, type)
            if nargin == 3
                % Construct from fraction data
                if type == "fraction"
                    [obj.numerator, obj.denominator] = simplifyFraction(a,b);
                    [obj.base, obj.period] = obj.decimalFromFraction();

                % Construct from decimal data
                elseif type == "decimal"
                    obj.base = a;
                    obj.period = b;
                    [obj.numerator, obj.denominator] = obj.fractionFromDecimal();
                end
            end
        end
        
        % Generate decimal data from fraction
        function [base, period] = decimalFromFraction(obj)

            % Get periodLength and baseOffset
            [periodLength, baseOffset] = clmFindPeriod(obj.denominator);

            % Expand the division as much as necessary
            decimalExpansion = nLengthDivision(obj.numerator, ...
                obj.denominator, ...
                1 + baseOffset + periodLength);

            % Seperate into base and period
            base = decimalExpansion(1:1+baseOffset);
            period = decimalExpansion(2+baseOffset:end);
        end

        % Generate fraction data from decimal
        function [numerator, denominator] = fractionFromDecimal(obj)
            
            if isempty(obj.period)
                [numerator, denominator] = simplifyFraction(listToInt(obj.base), 10^(length(obj.base)-1));
            else

                % Generate the numerator and denominator
                numerator = listToInt(obj.base)*(10^(length(obj.period))-1) + listToInt(obj.period)*(10^-(length(obj.base)-1))*(10^(length(obj.base)-1));
                denominator = 10^(length(obj.base)-1) * (10^(length(obj.period))-1);
    
                % Simplify fraction
                [numerator, denominator] = simplifyFraction(numerator, denominator);
            end
        end
    end
end