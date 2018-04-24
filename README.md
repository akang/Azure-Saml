# Azure-Saml
Sample SAML code that performs SSO with Azure using HTTP Post Binding. Read the Azure configuration sections on how to setup the SSO in the Azure console.

# Azure configuration
https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-single-sign-on-protocol-reference

https://docs.microsoft.com/en-us/azure/active-directory/active-directory-saas-custom-apps


# Java version
1.7 and above

# Description
index.jsp - creates SAML Request and posts the data to Azure SAML endpoint.

returnUrl.jsp - the page where Azure redirects the user to after successful login. The SAML Response is sent back as a parameter to the url



