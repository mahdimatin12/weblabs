<%--
    Document   : vowel
    Created on : 27-Nov-2022, 10:34:36 PM
    Author     : 236365
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String s = request.getParameter("S");%>
<%!
    int frequency(char c, String string) {
        int count = 0;
        if (string != null) {
            string = string.toLowerCase();
            for (int i = 0; i < string.length(); i++) {
                if (c == string.charAt(i)) {
                    count++;
                }
            }
        }
        return count;
    }

    private int spaces(String s) {
        return (int) s.strip().chars().filter(c -> c == ' ').count();
    }

    private String compressed(String s) {
        return s.replaceAll(" ", "");
    }

%>

<table>
    <thead>

    <th>Compressed</th> 
    <th>Spaces</th>
</thead>  
<tr>

    <td><%= compressed(s)%></td>
    <td><%= spaces(s)%></td>      
</tr>   
</table>


<table>

    <thead>
    <th>Vowel</th>
    <th>Frequency</th>
    </thead>

<%
    char vowel[] = {'a', 'e', 'i', 'o', 'u'};
    for (int i = 0; i < vowel.length; i++) {
%>
<thead>
    <td><%= vowel[i]%></td>                            
    <td><%= frequency(vowel[i], s)%></td>
</tr>        
<% }%>
</table>
