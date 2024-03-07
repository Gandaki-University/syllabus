<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Course Syllabus</title>
        <link rel="stylesheet" href="/public/css/style.css"/>
      </head>
      <body>
        <div class="container">
          <h1>Course Content</h1>
          
          <!-- Syllabus Section -->
          <div class="section-grid">
            <div class="section">
              <h2>Syllabus</h2>
              <div class="header">
                    <h3>Chapter</h3>
                    <h3>Lecture Hours</h3>
                    <h4>Lecture Subtopics</h4>
                </div>
              <div class="content">
                 <xsl:apply-templates select="course/syllabus/chapter"/>
              </div>
            </div>
            
            <!-- Assignments Section -->
            <div class="section">
              <h2>Assignments</h2>
              <div class="header">
                    <h3>Title</h3>
                    <h3>Objectives</h3>
                    <h3>Deadline</h3>
                    <h3>Pulished Date</h3>
                    <h3>Assignment Files</h3>
                </div>
              <div class="content">
                <xsl:apply-templates select="course/assignments/assignment"/>
              </div>
            </div>
            
            <!-- Course Handouts Section -->
            <div class="section">
              <h2>Course Handouts</h2>
              <div class="header">
                    <h3>Lecture Title</h3>
                    <h3>Files</h3>
                </div>
              <div class="content">
                <xsl:apply-templates select="course/course_handouts/lecture"/>
              </div>
            </div>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>

  <!-- Template for chapters -->
  <xsl:template match="chapter">
    <h3><xsl:value-of select="title"/></h3>
    <p> <!--Lecture Hours:--> <xsl:value-of select="lecture_hours"/></p>
    <ul>
      <xsl:apply-templates select="lecture_subtopics/subtopic"/>
    </ul>
  </xsl:template>

  <!-- Template for lecture subtopics -->
  <xsl:template match="subtopic">
    <li><xsl:value-of select="."/></li>
  </xsl:template>

  <!-- Template for assignments -->
  <xsl:template match="assignment">
    <h3><xsl:value-of select="title"/></h3>
    <p><!--Objectives:-->  <xsl:value-of select="objectives"/></p>
    <p><!--Deadline Date:--> <xsl:value-of select="deadline_date"/></p>
    <p><!--Published Date:--> <xsl:value-of select="published_date"/></p>
    <p><!--Files:--></p>
    <ul>
      <xsl:apply-templates select="files/file"/>
    </ul>
  </xsl:template>

  <!-- Template for course handouts -->
  <xsl:template match="lecture">
    <h3><xsl:value-of select="title"/></h3>
    <p><!--Files: --></p>
    <ul>
      <xsl:apply-templates select="files/file"/>
    </ul>
  </xsl:template>

  <!-- Template for files -->
  <xsl:template match="file">
    <li><a href="{.}"><xsl:value-of select="."/></a></li>
  </xsl:template>
</xsl:stylesheet>
