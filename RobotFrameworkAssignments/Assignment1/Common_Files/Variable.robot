*** Settings ***
Documentation     A resource file with reusable keywords and variables.
Library           SeleniumLibrary
Resource	  Resource.robot

*** Variables ***

${username}              xyz@einfochips.com
${password}      	 ********
${url}                   https://intranet.einfochips.com
${browser_name}          Chrome
${input_text}		 rish
@{actuallist}=     create list