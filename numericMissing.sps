* Python function to change the missing values of all numeric variables.
* by Jamie DeCoster

* Usage: numericMissing(definition string)
* Here, definition refers to an spss definition of possible missing values. 
* It can be a single missing value, like "-9", or it can be a list in the form
* allowed by SPSS, such as "low thru -1, 999". The definition string has
* to be put in quotes.

************
* Version History
************
* 2013-08-27 Created

begin program python.
import spss

def numericMissing(definition):
    for varnum in range(spss.GetVariableCount()):
        if (spss.GetVariableType(varnum) == 0):
      # for numeric variables
            submitstring = """
missing values %s (%s).""" %(spss.GetVariableName(varnum), definition)
            spss.Submit(submitstring)

end program python.
