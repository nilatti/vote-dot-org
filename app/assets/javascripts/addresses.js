// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
jQuery.validator.addMethod("allowsOnlyLettersAndSpaces", function(value, element, param)
{
  if(this.optional(element))
  {
    return true;
  }
  if(/^[a-zA-Z\s]+$/.test(value))
  {
    return true;
  }
  return false;
}, "Please include the address number.");
jQuery.validator.addMethod("startsWithStreetNumber", function(value, element, param)
{
  if(this.optional(element))
  {
    return true;
  }
  if(/^\d+\s/.test(value))
  {
    return true;
  }
  return false;
}, "This doesn't look like a valid address.");

jQuery.validator.addMethod("isValidZipCode", function(value, element, param)
{
  if(this.optional(element))
  {
    return true;
  }
  if(/^\d{5}(\-?\d{4})?$/.test(value))
  {
    return true;
  }
  return false;
}, "Please include a valid zip code.");

function validateAddressFunction() {

    $("#new_address").validate(
      {
        debug: false,
        rules:
          {
            "address[zip_code]": { isValidZipCode: true },
            "address[street_address]": { startsWithStreetNumber: true },
            "address[city]": { allowsOnlyLettersAndSpaces: true }
          }
        });
    }
$(document).ready(validateAddressFunction);
$(document).on('page:load', validateAddressFunction);
