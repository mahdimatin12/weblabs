<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Admin View</title>
                <style>
                    table {
                    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                    width: 100%;
                    margin-top: 25px;
                    border-collapse: collapse;
                    }
                    caption {
                    text-align: right;
                    font-size: .85em;
                    margin-bottom: 10px;
                    }
                    th, td {
                    font-size: 1.1em;
                    border: 1px solid #DDB575;
                    padding: 3px 7px 2px 7px;
                    }
                    th {
                    text-transform:uppercase;
                    text-align: left;
                    padding-top: 5px;
                    padding-bottom: 4px;
                    background: rgb(229,76,16);
                    background: linear-gradient(to bottom, rgb(229,76,16), rgb(173,54,8));
                    color: white;
                    }
                    tr:nth-of-type(even){
                    background-color: rgba(255,255,255,.1);
                    }
                    tr:nth-of-type(odd){
                    background-color: rgba(229,76,16,.1);
                    }

                </style>
            </head>
            <body>               
                <xsl:apply-templates/>                
            </body>
        </html>
    </xsl:template>
    <xsl:template match="users">
        <table>
            <caption>User List</caption>
            <thead>                
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Date of Birth</th>               
            </thead>
            <tbody>
                <xsl:apply-templates/>
            </tbody>
        </table>
    </xsl:template>
    <xsl:template match="/users/user">
        <tr>
            <td>
                <xsl:value-of select="ID"/>
            </td>
            <td>
                <xsl:value-of select="name"/>
            </td>
            <td>
                <xsl:variable name="emailurl" select="email"></xsl:variable>
                <a href="http://localhost:8080/weblabs/account.jsp?emailView={$emailurl}">
                    <xsl:value-of select="email"/>
                </a>
            </td>
            <td>
                <xsl:value-of select="dob"/>
            </td>
            
        </tr>        
    </xsl:template>
</xsl:stylesheet>
