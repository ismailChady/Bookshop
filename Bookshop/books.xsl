<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="html" indent="yes" encoding="UTF-8"/>
  
  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="UTF-8"/>
        <title>Bookshop Catalogue</title>
        <style>
          body {
          margin: 0;
          font-family: Arial, sans-serif;
          background-color: #f6eee3;
          color: #2b2b2b;
          }
          
          .page {
          width: 95%;
          max-width: 1400px;
          margin: 30px auto;
          }
          
          .top-bar {
          display: flex;
          justify-content: space-between;
          align-items: center;
          gap: 20px;
          margin-bottom: 25px;
          flex-wrap: wrap;
          }
          
          .title-box h1 {
          margin: 0;
          font-size: 34px;
          }
          
          .title-box p {
          margin: 8px 0 0 0;
          font-size: 16px;
          }
          
          .home-link {
          text-decoration: none;
          background-color: #6f5434;
          color: white;
          padding: 12px 18px;
          border-radius: 8px;
          font-weight: bold;
          }
          
          .info-box {
          background-color: #fffaf5;
          border-left: 6px solid #b8895a;
          padding: 15px 18px;
          margin-bottom: 20px;
          border-radius: 8px;
          }
          
          .catalogue-table {
          width: 100%;
          border-collapse: collapse;
          background-color: white;
          box-shadow: 0 4px 16px rgba(0,0,0,0.08);
          overflow: hidden;
          }
          
          .catalogue-table th {
          background-color: #8c6745;
          color: white;
          padding: 14px 10px;
          text-align: left;
          font-size: 15px;
          }
          
          .catalogue-table td {
          border-bottom: 1px solid #e8d8c7;
          padding: 12px 10px;
          vertical-align: top;
          font-size: 14px;
          }
          
          .catalogue-table tr:nth-child(even) {
          background-color: #fcf7f2;
          }
          
          .book-cover {
          width: 90px;
          height: 120px;
          object-fit: cover;
          border-radius: 6px;
          border: 1px solid #d6c0ab;
          }
          
          .genre-tag {
          display: inline-block;
          background-color: #ead8c4;
          color: #4d3722;
          padding: 6px 10px;
          border-radius: 20px;
          font-size: 12px;
          font-weight: bold;
          }
          
          .buy-link {
          display: inline-block;
          text-decoration: none;
          background-color: #3a7d44;
          color: white;
          padding: 8px 12px;
          border-radius: 6px;
          font-weight: bold;
          }
          
          .stock-high {
          color: #1f7a1f;
          font-weight: bold;
          }
          
          .stock-low {
          color: #b22222;
          font-weight: bold;
          }
          
          .footer-note {
          margin-top: 18px;
          font-size: 13px;
          color: #5a5a5a;
          }
        </style>
      </head>
      
      <body>
        <div class="page">
          <div class="top-bar">
            <div class="title-box">
              <h1>Bookshop Catalogue</h1>
              <p>Explore our available books by genre, price, stock, and description.</p>
            </div>
            <a class="home-link" href="../index.html">Back to Homepage</a>
          </div>
          
          <div class="info-box">
            <strong>Total books available:</strong>
            <xsl:value-of select="count(bookshop/book)"/>
          </div>
          
          <table class="catalogue-table">
            <tr>
              <th>Cover</th>
              <th>Title</th>
              <th>Author</th>
              <th>Genre</th>
              <th>Price</th>
              <th>Year</th>
              <th>ISBN</th>
              <th>Stock</th>
              <th>Description</th>
              <th>Order</th>
            </tr>
            
            <xsl:for-each select="bookshop/book">
              <xsl:sort select="genre"/>
              <xsl:sort select="title"/>
              
              <tr>
                <td>
                  <img class="book-cover" src="{image}" alt="{title}"/>
                </td>
                
                <td>
                  <strong><xsl:value-of select="title"/></strong>
                </td>
                
                <td>
                  <xsl:value-of select="author"/>
                </td>
                
                <td>
                  <span class="genre-tag">
                    <xsl:value-of select="genre"/>
                  </span>
                </td>
                
                <td>
                  Rs <xsl:value-of select="price"/>
                </td>
                
                <td>
                  <xsl:value-of select="year"/>
                </td>
                
                <td>
                  <xsl:value-of select="isbn"/>
                </td>
                
                <td>
                  <xsl:choose>
                    <xsl:when test="number(stock) &gt;= 15">
                      <span class="stock-high">
                        <xsl:value-of select="stock"/> in stock
                      </span>
                    </xsl:when>
                    <xsl:otherwise>
                      <span class="stock-low">
                        <xsl:value-of select="stock"/> left
                      </span>
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
                
                <td>
                  <xsl:value-of select="description"/>
                </td>
                
                <td>
                  <a class="buy-link" href="{purchaseLink}">Buy / Enquire</a>
                </td>
              </tr>
            </xsl:for-each>
          </table>
          
          <p class="footer-note">
            This catalogue is generated from the XML book data using XSL transformation.
          </p>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>