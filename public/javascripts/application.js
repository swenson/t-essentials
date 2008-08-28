// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function addButtonClasses()
{
  var elements = document.getElementsByTagName('input');

  for (var i=0; i < elements.length; i++ )
  {
    if (elements[i].getAttribute('type'))
    {
      if (elements[i].getAttribute('type') == "submit")
        elements[i].className = "submit";
      else if (elements[i].getAttribute('type') == "button")
        elements[i].className = "button";
    }
  }
}

window.onload = function() { addButtonClasses(); }