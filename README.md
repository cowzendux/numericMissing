# numericMissing

SPSS Python Extension function to assign missing values to all numeric variables simultaneously

This function allows you to define the missing values for all of your numeric variables using a single command. Although the missing values statement in SPSS does provide an "all" keyword that will assign values to all of your variables, this will produce an error if you have any string variables in the data set. This function will look for the numeric variables and define their missing values, even if you have string variables in the data set.

## Usage
**numericMissing(definition, missingRecode = None)**
* "definition" is a string referring to an spss definition of possible missing values. It can be a single missing value, like "-9", or it can be a list in the form allowed by SPSS, such as "low thru -1, 999". The definition string has to be put in quotes. This argument is required.
* "missingRecode" is a number that indicates the value that existing missing values should be set to

## Example
**numericMissing(definition = "-9, -99, -999", missingRecode = "-999")**
* This would indicate that at values of -9, -99, and -999 indicate missing values for all of the numeric variables in your data set.
* Any cases that have existing missing values will be changed to -999.
