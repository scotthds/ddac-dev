<%@ page import="java.util.*,java.io.*"%>

  <%
%>
    <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
          <style>
            body {
              font-family: Arial;
            }

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
            <h2>DDAC (DataStax Distribution of Apache Cassandra)
            </h2>
          </center>
          <br>
            <div class="tab">
              <button class="tablinks" onclick="openDDACTab(event, 'ddaco')">What is DDAC?</button>
              <button class="tablinks" onclick="openDDACTab(event, 'getstarted')">Getting Started</button>
              <button class="tablinks" onclick="openDDACTab(event, 'bulkloader')">Bulk Loader</button>
              <button class="tablinks" onclick="openDDACTab(event, 'kafka')">Kafka</button>
              <button class="tablinks" onclick="openDDACTab(event, 'exampleclients')">Example Clients</button>
              <button class="tablinks" onclick="openDDACTab(event, 'support')">Support</button>
              <button class="tablinks" onclick="openDDACTab(event, 'training')">Training</button>
            </div>

            <div id="ddaco" class="tabcontent">
              <h3>DDAC</h3>
              <a href="https://www.datastax.com/products/datastax-distribution-of-apache-cassandra" target="_blank">Datastax and Apache Cassandra</a>
              <br>
                <br>
                  <a href="https://docs.datastax.com/en/ddac/doc/index.html" target="_blank">DDAC Operational Documentation</a>
                  <br>
                    <br></div>

                    <div id="getstarted" class="tabcontent">
                      <h3>The DDAC deployment includes a development VM whose IP is
                      </h3>

                      <%

                String srvurl=null;
                String ddacdocurl=null;
                String trainingurl=null;
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
                  trainingurl = "http://"+ disr +":8080/ddac/class-list-march-july-2019.html";
                  disr = dis.readLine();
                }


                %>


                        <h4>Cluster Status</h4>
                        <p>You can check the cluster status by loggin into one of the nodes and running <bold>nodetool</bold></p>
                        <p>ssh <username>@10.0.0.5, which is a node in the cluster, using the same credentials you provided at deployment</p>
                        <p>from the command line run <bold>nodetool status</bold></p>

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
                              <br></div>
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
                                      <br></div>
                                      <div id="exampleclients" class="tabcontent">
                                        <h3>Example Clients</h3>
                                        <p>
                                          A simple java connection test client that uses the datstax driver is located under /opt/dev/ConnectionTest
                                        </p>
                                        <p>
                                          See the README.md for more information on building and running.
                                        </p>
                                      </div>
                                      <div id="support" class="tabcontent">
                                        <center>
                                          <h3>Before You Call Support</h3>
                                          <img src="./supportwrench.gif" alt="theeye" height="150" width="127"></center>
                                          <p>
                                            <p>
                                              <h4>Authentication</h4>
                                              For simplicity, DDAC deploys with the default authenticator set to AllowAllAuthenticator. You can easily change this configuration yourself by following the instructions
                                              <a href="https://docs.datastax.com/en/ddac/doc/ddac/security/secureConfigNativeAuth.html" target="_blank">here</a>
                                            </p>
                                            <p>
                                              <h4>More Advanced Security</h4>
                                              For more information on how you can further secure DDAC, follow the steps
                                              <a href="https://docs.datastax.com/en/ddac/doc/ddac/security/secureDDACToc.html" target="_blank">here</a>
                                            </p>

                                            <p>
                                              <h4>Logging changes</h4>
                                              As you cluster grows, you will want to modify your logging configuration and file locations. You can easily do this yourself by following the instructions
                                              <a href="https://docs.datastax.com/en/dse/5.1/dse-admin/datastax_enterprise/config/chgLogLocations.html" target="_blank">here</a>
                                            </p>

                                            <h4>Azure Deployment Failure</h4>
                                            <p>
                                              On occassion, there can be Azure platform failures that prevent Datastax Apache Cassandra from deployment. The VMs may be deployed but cassandra is not running on the nodes.
                                            </p>
                                            <p>
                                              One type of error that happens on deploy is related to quotas in your Azure Subscription<br>
                                                if you see an error message in the Azure like
                                                <br>
                                                  <br>
                                                    <img src="./quota-failure.png" alt="quotaerr" height="163" width="400">
                                                      <br>
                                                        <br>
                                                          this indicates you don't have the needed Azure Resource quotas to deploy DDAC. Change your quota limits, delete the Azure Resource Group associated with this failed deployment and deploy from the Marketplace again.
                                                        </p>
                                                        <p>
                                                          Another type of error that happens on deploy is related extension timeouts in the ARM templates<br>
                                                            if you see an error message in the Azure like
                                                            <br>
                                                              <br>
                                                                <img src="./ext-timeout.png" alt="exterr" height="211" width="400">
                                                                  <br><br? this="this" indicates="indicates" a="a" possible="possible" failure="failure" on="on" the="the" Azure="Azure" Platform="Platform" or="or" with="with" ARM="ARM" templates.="templates." You="You" should="should" gather="gather" needed="needed" log="log" files="files" and="and" send="send" them="them" to="to" partner-architecture@datastax.com="partner-architecture@datastax.com" <p> VM="VM" dc0vm0="dc0vm0" find="find" these="these" scp="scp" your="your" local="local" machine="machine" <ul> <li>/var/log/waagent.log</li>
                                                                  <li>/var/log/syslog</li>
                                                                  <li>var/log/azure/custom-script/handler.log</li>
                                                                  <li>/var/lib/waagent/custom-script/download/0/stderr</li>
                                                                  <li>/var/lib/waagent/custom-script/download/0/stdout</li>
                                                                </ul>
                                                                After sending us the logs, you can try deleting the Azure Resource Group associated with this failed deployment and deploying from the Marketplace again.
                                                              </p>
                                                            </p>
                                                            <p>
                                                              <h4>If it is not seen here . . .</h4>
                                                              Then use your support login and go to
                                                              <a href="https://support.datastax.com/hc/en-us" target="_blank">here</a>
                                                            </p>

                                                          </div>
                                                          <div id="training" class="tabcontent">
                                                            <h3>Training</h3>
                                                            <p>
                                                              2019 Schedule can be found
                                                              <a href="<%= trainingurl %>" target="_blank">here</a>
                                                            </p>

                                                          </div>

                                                          <script>
                                                            function openDDACTab(evt, tabName) {
                                                              var i,
                                                                tabcontent,
                                                                tablinks;
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
