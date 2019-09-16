* Encoding: UTF-8.
* Python function to change the missing values of all numeric variables.
* by Jamie DeCoster

**** Usage: numericMissing(definition, missingRecode = None)
**** "definition" refers to an spss definition of possible missing values. 
* It can be a single missing value, like "-9", or it can be a list in the form
* allowed by SPSS, such as "low thru -1, 999". The definition string has
* to be put in quotes.
**** "missingRecode" is a number that indicates the value that existing 
* missing values should be set to.

************
* Version History
************
* 2013-08-27 Created
* 2019-08-05 Added missingRecode option

begin program python.
import spss

def numericMissing(definition, missingRecode = None):
    for varnum in range(spss.GetVariableCount()):
        if (spss.GetVariableType(varnum) == 0):
      # for numeric variables
            varname = spss.GetVariableName(varnum)
            submitstring = "missing values {0} ({1}).".format(varname, definition)
            if (missingRecode != None):
                submitstring = submitstring + """
recode {0} (MISSING = {1}).
execute.""".format(varname, missingRecode) 
      # if there is a recode 
            spss.Submit(submitstring)

end program python.
