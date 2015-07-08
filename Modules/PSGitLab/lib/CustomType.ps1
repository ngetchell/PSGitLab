$ValidatePattern = @"
using System;
using System.ComponentModel;
using System.Management.Automation;
using System.Text.RegularExpressions;
[AttributeUsage(AttributeTargets.Field | AttributeTargets.Property)]
public class ValidatePatternExAttribute : ValidateEnumeratedArgumentsAttribute
{
   private RegexOptions _options = RegexOptions.IgnoreCase;
   private string _pattern;
   private string _message;

   protected override void ValidateElement(object element)
   {
      if (element == null)
      {
         throw new ValidationMetadataException(_message + "\nValidatePatternEx Failure: Argument Is Null");
      }
      string input = element.ToString();
      Regex regex = null;
      regex = new Regex(_pattern, _options);
      if (!regex.Match(input).Success)
      {
         throw new ValidationMetadataException(_message + "\nValidatePatternEx failure, the value didn't match the pattern: " + _pattern);
      }
   }

   public RegexOptions Options
   {
      get
      {
         return _options;
      }
      set
      {
         _options = value;
      }
   }

   public string Pattern
   {
      get
      {
         return _pattern;
      }
      set
      {
         if (string.IsNullOrEmpty(value))
         {
            throw new ArgumentException("RegularExpression Pattern is null or empty", "message");
         }
         _pattern = value;
      }
   }

   public string Message
   {
      get
      {
         return _message;
      }
      set
      {
         if (string.IsNullOrEmpty(value))
         {
            throw new ArgumentException("Error Message is null or empty", "message");
         }
         _message = value;
      }
   }
}
"@

Add-Type -TypeDefinition $ValidatePattern
