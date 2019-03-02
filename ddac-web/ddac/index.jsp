<%@ page import="java.util.*,java.io.*"%>

<%
%>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
    body {font-family: Arial;}

    /* Style the tab */
    .tab {
      overflow: hidden;
      border: 1px solid #ccc;
      background-color: #199bea;
    }

    /* Style the buttons inside the tab */
    .tab button {
      background-color: inherit;
      float: left;
      border: none;
      outline: none;
      cursor: pointer;
      padding: 14px 16px;
      transition: 0.3s;
      font-size: 17px;
    }

    /* Change background color of buttons on hover */
    .tab button:hover {
      background-color: #878f99;
    }

    /* Create an active/current tablink class */
    .tab button.active {
      background-color: #ea9e0e;
    }

    /* Style the tab content */
    .tabcontent {
      display: none;
      padding: 6px 12px;
      border: 1px solid #ea9e0e;
      border-top: none;
    }
    </style>
  </head>
  <body>
    <center>
      <h2>DDAC (DataStax Distribution of Apache Cassandra) </h2>
    </center>
    <br>
      <div class="tab">
        <button class="tablinks" onclick="openDDACTab(event, 'ddaco')">What is DDAC?</button>
        <button class="tablinks" onclick="openDDACTab(event, 'getstarted')">Getting Started</button>
        <button class="tablinks" onclick="openDDACTab(event, 'bulkloader')">Bulk Loader</button>
        <button class="tablinks" onclick="openDDACTab(event, 'kafka')">Kafka</button>
        <button class="tablinks" onclick="openDDACTab(event, 'exampleclients')">Example Clients</button>
      </div>



      <div id="ddaco" class="tabcontent">
        <h3>DDAC</h3>
        <a href="https://www.datastax.com/products/datastax-distribution-of-apache-cassandra" target="_blank">Datastax and Apache Cassandra</a>
        <br>
          <br>
            <a href="https://docs.datastax.com/en/ddac/doc/index.html" target="_blank">DDAC Operational Documentation</a>
            <br>
              <br>
              </div>

              <div id="getstarted" class="tabcontent">
                <h3>The DDAC deployment includes a development VM whose IP is </h3>

                <%

                String srvurl=null;
                String ddacdocurl=null;
                Process p =
                Runtime.getRuntime().exec("/opt/dev/findPIP.sh");
                OutputStream os = p.getOutputStream();
                InputStream in = p.getInputStream();
                DataInputStream dis = new DataInputStream(in);
                String disr = dis.readLine();
                while ( disr != null ) {
                  out.println(disr);
                  srvurl = "http://"+ disr +":8080/ddac-servlet-0.0.1-SNAPSHOT/getstarted";
                  ddacdocurl = "http://"+ disr +":8080/ddac/ddac-on-azure.html";
                  disr = dis.readLine();
                }


                %>

                <h4> Azure Specific Information is <a href="<%= ddacdocurl %>">here</a></h4>


                <h4>Retrieve cluster name, hosts and keyspaces</h4>
                <form name="loginForm" method="post" action="<%= srvurl %>" target=”_blank”>
                  <input type="submit" value="Get Info" />
                </form>

              </div>
              <div id="bulkloader" class="tabcontent">
                <h3>Bulk Loader</h3>
                <p>
                  The Datastax Bulk Loader is located under /opt/dev/dsbulk
                </p>
                <p>
                  See the links below for more information about getting started.
                </p>
                <br>
                  <a href="https://www.datastax.com/2018/05/introducing-datastax-bulk-loader" target="_blank">Bulk Loader Blog</a>
                  <br>
                    <br>
                      <a href="https://docs.datastax.com/en/dsbulk/doc/index.html" target="_blank">Bulk Loader Documentation</a>
                      <br>
                      </div>
                      <div id="kafka" class="tabcontent">
                        <h3>Kafka</h3>
                        <p>
                          The Datastax Kafka connector islocated under /opt/dev/kafka
                        </p>
                        <p>
                          See the links below for more information about getting started.
                        </p>
                        <br>
                          <a href="https://www.datastax.com/2018/12/introducing-the-datastax-apache-kafka-connector" target="_blank">Kafka Blog</a>
                          <br>
                            <br>
                              <a href="https://docs.datastax.com/en/kafka/doc/index.html" target="_blank">Kafka Documentation</a>
                              <br>
                              </div>
                              <div id="exampleclients" class="tabcontent">
                                <h3>Example Clients</h3>
                                <p>
                                  A simple java connection test client that uses the datstax driver is located under /opt/dev/ConnectionTest
                                </p>
                                <p>
                                  See the README.md for more information on building and running.
                                </p>
                              </div>



                              <script>
                              function openDDACTab(evt, tabName) {
                                var i, tabcontent, tablinks;
                                tabcontent = document.getElementsByClassName("tabcontent");
                                for (i = 0; i < tabcontent.length; i++) {
                                  tabcontent[i].style.display = "none";
                                }
                                tablinks = document.getElementsByClassName("tablinks");
                                for (i = 0; i < tablinks.length; i++) {
                                  tablinks[i].className = tablinks[i].className.replace(" active", "");
                                }
                                document.getElementById(tabName).style.display = "block";
                                evt.currentTarget.className += " active";
                              }
                              </script>

                            </body>
                          </html>