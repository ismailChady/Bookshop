<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="html" indent="yes" encoding="UTF-8"/>
  
  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="UTF-8"/>
        <title>Bookshop XML Catalogue</title>
        
        <script>
          window.onload = function() {
          if (window.location.hash) {
          var id = window.location.hash.substring(1);
          var el = document.getElementById(id);
          if (el) {
          el.scrollIntoView();
          }
          }
          }
        </script>
        
        <style>
          body {
          font-family: Arial, sans-serif;
          background-color: #f8f5ef;
          margin: 0;
          padding: 30px;
          color: #222;
          }
          
          .container {
          max-width: 1200px;
          margin: 0 auto;
          background-color: #ffffff;
          padding: 30px;
          border-radius: 10px;
          box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
          }
          
          h1 {
          text-align: center;
          margin-bottom: 10px;
          }
          
          .subtitle {
          text-align: center;
          margin-bottom: 25px;
          }
          
          table {
          width: 100%;
          border-collapse: collapse;
          margin-bottom: 40px;
          }
          
          th, td {
          border: 1px solid #cccccc;
          padding: 10px;
          text-align: left;
          vertical-align: top;
          }
          
          th {
          background-color: #222222;
          color: #ffffff;
          }
          
          tr:nth-child(even) {
          background-color: #f3f3f3;
          }
          
          .details-btn {
          text-decoration: none;
          background-color: #222222;
          color: #ffffff;
          padding: 8px 14px;
          border-radius: 6px;
          display: inline-block;
          font-size: 14px;
          }
          
          .detail-section {
          margin-top: 40px;
          padding: 20px;
          border: 1px solid #dddddd;
          border-radius: 10px;
          background-color: #fafafa;
          }
          
          .detail-section h2 {
          margin-top: 0;
          }
          
          .detail-row {
          margin-bottom: 10px;
          line-height: 1.6;
          }
          
          .label {
          font-weight: bold;
          }
          
          .back-top,
          .back-link {
          margin-top: 20px;
          }
          
          .back-top a,
          .back-link a {
          text-decoration: none;
          background-color: #222222;
          color: #ffffff;
          padding: 10px 18px;
          border-radius: 6px;
          display: inline-block;
          }
          
          .back-link {
          text-align: center;
          margin-top: 30px;
          }
        </style>
      </head>
      
      <body>
        <div class="container">
          <a id="top"></a>
          
          <h1>Bookshop XML Catalogue</h1>
          <p class="subtitle">Click on a book to view its full details.</p>
          
          <table>
            <tr>
              <th>Title</th>
              <th>Author</th>
              <th>Genre</th>
              <th>Price</th>
              <th>View</th>
            </tr>
            
            <xsl:for-each select="bookshop/book">
              <tr>
                <td><xsl:value-of select="title"/></td>
                <td><xsl:value-of select="author"/></td>
                <td><xsl:value-of select="genre"/></td>
                <td>Rs <xsl:value-of select="price"/></td>
                <td>
                  <a class="details-btn">
                    <xsl:attribute name="href">#<xsl:value-of select="@id"/></xsl:attribute>
                    View Details
                  </a>
                </td>
              </tr>
            </xsl:for-each>
          </table>
          
          <xsl:for-each select="bookshop/book">
            <div class="detail-section">
              <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
              
              <h2><xsl:value-of select="title"/></h2>
              
              <div class="detail-row">
                <span class="label">Author:</span>
                <xsl:text> </xsl:text>
                <xsl:value-of select="author"/>
              </div>
              
              <div class="detail-row">
                <span class="label">Genre:</span>
                <xsl:text> </xsl:text>
                <xsl:value-of select="genre"/>
              </div>
              
              <div class="detail-row">
                <span class="label">Price:</span>
                <xsl:text> Rs </xsl:text>
                <xsl:value-of select="price"/>
              </div>
              
              <div class="detail-row">
                <span class="label">Year:</span>
                <xsl:text> </xsl:text>
                <xsl:value-of select="year"/>
              </div>
              
              <div class="detail-row">
                <span class="label">ISBN:</span>
                <xsl:text> </xsl:text>
                <xsl:value-of select="isbn"/>
              </div>
              
              <div class="detail-row">
                <span class="label">Quantity:</span>
                <xsl:text> </xsl:text>
                <xsl:value-of select="quantity"/>
              </div>
              
              <div class="detail-row">
                <span class="label">Description:</span>
                <xsl:text> </xsl:text>
                <xsl:value-of select="description"/>
              </div>
              
              <div class="back-top">
                <a href="#top">Back to Catalogue</a>
              </div>
            </div>
          </xsl:for-each>
          
          <div class="back-link">
            <a href="../shop.html">Back to Shop</a>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
  
</xsl:stylesheet>
