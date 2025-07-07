<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - MovieHerau</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/about.css"/>
</head></head>
<body>
    <div class="container">
        <header>
            <h1>About Us</h1>
        </header>
        <div class="card">
            <h1 align="center">🎬 Movieहेरम</h1>
            <div style="text-align: center;">
                <p>
                    Welcome to Movieहेरम – your ultimate destination for streaming cinema that ignites passion. Born 
                    on April 1st, 2025, we're not just a platform — we're a movement. A cinematic red sanctuary, made
                    for movie freaks, series bingers, and cartoon nostalgics.<br><br>


                    Powered by the latest tech and a love for storytelling, we curate bold blockbusters, indie treasures,
                    and everything in between. No ads. No drama. Just pure stream bliss.<br><br>

                
                    Whether you're here for thrillers at midnight or cartoons on a Sunday morning — Movieहेरम is your
                    new favorite obsession.<br><br>
                    <ul>
                        <li><strong>Integrity</strong>: We believe in being honest and transparent in all our dealings.</li>
                        <li><strong>Excellence</strong>: We are committed to providing the highest quality in everything we do.</li>
                        <li><strong>Customer-Centric</strong>: Our customers are at the heart of our business.</li>
                    </ul>
                </p> 
            </div>
        </div>
        <div class="card-row">
            <div class="card">
                <img src="${pageContext.request.contextPath}/resources/images/user/avatar1.png" alt="Developer 5" class="card-image">
                <h3>Aryan Bhandary</h3>
                <p>Project Manager</p>
                <button class="card-button" data-modal="modal5">Learn More</button>
            </div>
            <div class="card">

                <img src="${pageContext.request.contextPath}/resources/images/user/avatar1.png" alt="Developer 1" class="card-image">
                <h3>Najib Thapa</h3>
                <p>Lead Developer</p>
                <button class="card-button" data-modal="modal1">Learn More</button>
            </div>
            <div class="card">
                <img src="${pageContext.request.contextPath}/resources/images/user/avatar1.png" alt="Developer 3" class="card-image">
                <h3>Pranay Shakya</h3>
                <p>Backend Developer</p>
                <button class="card-button" data-modal="modal3">Learn More</button>
            </div>
            <div class="card">
                <img src="${pageContext.request.contextPath}/resources/images/user/rohit.PNG" alt="Developer 2" class="card-image">
                <h3>Rohit Joshi</h3>
                <p>UI/UX Designer</p>
                <button class="card-button" data-modal="modal2">Learn More</button>
            </div>
            <div class="card">
                <img src="${pageContext.request.contextPath}/resources/images/user/avatar1.png" alt="Developer 4" class="card-image">
                <h3>Shrine Ghimire</h3>
                <p>Content Manager</p>
                <button class="card-button" data-modal="modal4">Learn More</button>
            </div>
        </div>

        <div id="modal5" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                

                <div class="modal-body">

                    <div class="con" class="cv">
                        <!-- top left introduction heading-->
                        <div class="con-hline">
                          <div style="width: 60%">
                            <div class="con" style="text-align: left; margin: 10px">
                              <div class="con-hline">
                                <div class="con-cell">
                                  <div class="con">
                                    <div class="con-hline">
                                      <div style="width: 50%; text-align: center">
                                        <img
                                          src="${pageContext.request.contextPath}/resources/images/user/avatar1.png"
                                          class="modal-image"
                                        /><!-- image file for introduction -->

                                      </div>
                                      <div style="width: 50%; text-align: left; ">
                                        <b> Aryan Bhandary</b><br/>
                                        <i>Project Manager</i>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                  
                              <div class="con-hline">
                                <!-- about me section -->
                                <div class="con-cell">
                                  <b> About Me</b><br/>
                                  <p class="text">
                                    I am a computing student studing at Islington College.
                                    I live in Radhe Radhe, Bhaktapur. I belive in hardwork 
                                    with interest in learning new topics. 
                                  </p>
                                </div>
                              </div>
                  
                              <div class="con-hline">
                                <!-- middle left  -->
                                <div class="con-cell">
                                  <br><b> Academic Qualification</b><br />
                                  <div class="con" style="padding: 10px">
                                    <div class="con-hline">
                                      <div style="padding: 10px;">
                                        <a>College:</a>
                                      </div>
                                      <div style="padding: 10px; width: 300px;">
                                        <c>Khwopa Higher Secondary School<br />
                                          Dekocha, Bhaktapur</c>
                                      </div>
                                    </div>
                                    <div class="con-hline">
                                      <div style="padding: 10px;">
                                        <a>University:</a>
                                      </div>
                                      <div style="padding: 10px; width: 300px;">
                                        <c>Islington College<br />
                                          KamalPokhari, Kathmandu</c>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                  
                              <div class="con-hline">
                                <!-- bottom left  -->
                                <div style="padding: 0px; margin-top: -10px;">
                                  <b> Interests</b><br>
                                  <c>Bikes </c><c> Music </c><c> Planes </c><c> Gaming </c>
                                </div>
                              </div>
                            </div>
                          </div>
                  
                          <div class="con-cell">
                            <!-- middle right  -->
                            <div class="con" style="text-align: left; margin-top: -40px;">
                              <div class="con-hline">
                                <div style="padding: 50px;">
                                  <b> Contact Me</b><br />
                                  <div class="con" style="padding: 10px">
                                    <div class="con-hline">
                                      <div class="con-cell"><a>Mobile:</a></div>
                                      <div class="con-cell">
                                        <c> 9767233360</c>
                                      </div>
                                    </div>
                                      <div class="con-cell">
                                        <a>Email:</a>
                                      </div>
                                      <div class="con-cell">
                                        <c>bhaaryan304@gmail.com</c>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div class="con-hline">
                                <!-- down right -->
                                <div style="padding-left: 50px;">
                                  <b>Skills</b>
                                  <div class="skill">
                                    <li>
                                      <a>HTML</a>
                                      <span class="bar"><span class="html"></span></span>
                                    </li>
                                    <li>
                                      <a>CSS</a>
                                      <span class="bar"><span class="css"></span></span>
                                    </li>
                                    <li>
                                      <a>PHP</a>
                                      <span class="bar"><span class="php"></span></span>
                                    </li>
                                    <li>
                                      <a>JAVA</a>
                                      <span class="bar"><span class="java"></span></span>
                                    </li>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                  </div>
            </div>
        </div>
        
        <div id="modal1" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <div class="modal-header">
		         <div class="con" class="cv">
                    <!-- top left introduction heading-->
                    <div class="con-hline">
                      <div style="width: 70%">
                        <div class="con" style="text-align: left; margin: 20px">
                          <div class="con-hline">
                            <div class="con-cell">
                              <div class="con">
                                <div class="con-hline">
                                  <div style="width: 50%; text-align: center">
                                    <img
                                      src="${pageContext.request.contextPath}/resources/images/user/avatar1.png"
                                      class="modal-image"
                                    /><!-- image file for introduction -->
                                  </div>
                                  <div style="width: 50%; text-align: left; ">
                                    <b> Najib Thapa</b><br/>
                                    <i>Lead Developer</i>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
              
                          <div class="con-hline">
                            <!-- about me section -->
                            <div class="con-cell">
                              <b> About Me</b><br />
                              <p class="text">
                                I am a computing student studying at Islington College. 
                                I live in Suryabinayak, Bhaktapur. I believe in hardwork
                                and aim to become a successful entrepreneur in teh future.
                              </p>
                            </div>
                          </div>
              
                          <div class="con-hline">
                            <!-- middle left  -->
                            <div class="con-cell">
                              <br><b> Academic Qualification</b><br />
                              <div class="con" style="padding: 10px">
                                <div class="con-hline">
                                  <div style="padding: 10px;">
                                    <a>College:</a>
                                  </div>
                                  <div style="padding: 10px; width: 300px;">
                                    <c>Khwopa Higher Secondary School<br />
                                      Dekocha, Bhaktapur</c>
                                  </div>
                                </div>
                                <div class="con-hline">
                                  <div style="padding: 10px;">
                                    <a>University:</a>
                                  </div>
                                  <div style="padding: 10px; width: 300px;">
                                    <c>Islington College<br />
                                      KamalPokhari, Kathmandu</c>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
              
                          <div class="con-hline">
                            <!-- bottom left  -->
                            <div style="padding: 0px; margin-top: -10px;">
                              <b> Interests</b><br>
                              <c>Bikes </c><c> Music </c><c> Planes </c><c> Gaming </c>
                            </div>
                          </div>
                        </div>
                      </div>
              
                      <div class="con-cell">
                        <!-- middle right  -->
                        <div class="con" style="text-align: left; margin-top: -40px;">
                          <div class="con-hline">
                            <div style="padding: 50px;">
                              <b> Contact Me</b><br />
                              <div class="con" style="padding: 10px">
                                <div class="con-hline">
                                  <div class="con-cell"><a>Mobile:</a></div>
                                  <div class="con-cell">
                                    <c> 9741234598</c>
                                  </div>
                                </div>
                                <div class="con-hline">
                                  <div class="con-cell">
                                    <a>Email:</a>
                                  </div>
                                  <div class="con-cell">
                                    <c>najibthapa7@gmail.com</c>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="con-hline">
                            <!-- down right -->
                            <div style="padding-left: 50px;">
                              <b>Skills</b>
                              <div class="skill">
                                <li>
                                  <a>HTML</a>
                                  <span class="bar"><span class="html"></span></span>
                                </li>
                                <li>
                                  <a>CSS</a>
                                  <span class="bar"><span class="css"></span></span>
                                </li>
                                <li>
                                  <a>PHP</a>
                                  <span class="bar"><span class="php"></span></span>
                                </li>
                                <li>
                                  <a>JAVA</a>
                                  <span class="bar"><span class="java"></span></span>
                                </li>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
        </div>
        
        <div id="modal3" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <div class="modal-header">
                  <div class="con" class="cv">
                    <!-- top left introduction heading-->
                    <div class="con-hline">
                      <div style="width: 60%">
                        <div class="con" style="text-align: left; margin: 20px">
                          <div class="con-hline">
                            <div class="con-cell">
                              <div class="con">
                                <div class="con-hline">
                                  <div style="width: 50%; text-align: center">
                                    <img
                                      src= "${pageContext.request.contextPath}/resources/images/user/avatar1.png"
                                      class="modal-image"
                                    /><!-- image file for introduction -->
                                  </div>
                                  <div style="width: 50%; text-align: left; ">
                                    <b> Pranay Shakya</b><br/>
                                    <i>Backend Developer</i>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
              
                          <div class="con-hline">
                            <!-- about me section -->
                            <div class="con-cell">
                              <b> About Me</b><br />
                              <p class="text">
                                I am a computing student studying at Islington College. 
                                I live in Sundhara, Kathmandu. I believe in self 
                                development and try to be a better version of myself on a daily basis.
                              </p>
                            </div>
                          </div>
              
                          <div class="con-hline">
                            <!-- middle left  -->
                            <div class="con-cell">
                              <br><b> Academic Qualification</b><br />
                              <div class="con" style="padding: 10px">
                                <div class="con-hline">
                                  <div style="padding: 10px;">
                                    <a>College:</a>
                                  </div>
                                  <div style="padding: 10px; width: 300px;">
                                    <c>St. Xavier's College<br />
                                      Maitighar, Kathmandu</c>
                                  </div>
                                </div>
                                <div class="con-hline">
                                  <div style="padding: 10px;">
                                    <a>University:</a>
                                  </div>
                                  <div style="padding: 10px; width: 300px;">
                                    <c>Islington College<br />
                                      KamalPokhari, Kathmandu</c>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
              
                          <div class="con-hline">
                            <!-- bottom left  -->
                            <div style="padding: 0px; margin-top: -10px;">
                              <b> Interests</b><br>
                              <c>Travelling </c><c> Music </c><c> Piano </c><c> Gaming </c>
                            </div>
                          </div>
                        </div>
                      </div>
              
                      <div class="con-cell">
                        <!-- middle right  -->
                        <div class="con" style="text-align: left; margin-top: -40px;">
                          <div class="con-hline">
                            <div style="padding: 50px;">
                              <b> Contact Me</b><br />
                              <div class="con" style="padding: 10px">
                                <div class="con-hline">
                                  <div class="con-cell"><a>Mobile:</a></div>
                                  <div class="con-cell">
                                    <c> 9840897210</c>
                                  </div>
                                </div>
                                <div class="con-hline">
                                  <div class="con-cell">
                                    <a>Email:</a>
                                  </div>
                                  <div class="con-cell">
                                    <c>shakyapranay7@gmail.com</c>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="con-hline">
                            <!-- down right -->
                            <div style="padding-left: 50px;">
                              <b>Skills</b>
                              <div class="skill">
                                <li>
                                  <a>HTML & CSS</a>
                                  <span class="bar"><span class="html"></span></span>
                                </li>
                                <li>
                                  <a>JAVA</a>
                                  <span class="bar"><span class="java"></span></span>
                                </li>
                                <li>
                                  <a>JavaScript</a>
                                  <span class="bar"><span class="js"></span></span>
                                </li>
                                <li>
                                  <a>C++</a>
                                  <span class="bar"><span class="c"></span></span>
                                </li>
                                <li>
                                  <a>Python</a>
                                  <span class="bar"><span class="python"></span></span>
                                </li>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
        </div>

        <div id="modal2" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <div class="modal-header">
                  <div class="con" class="cv">
                    <!-- top left introduction heading-->
                    <div class="con-hline">
                      <div style="width: 60%">
                        <div class="con" style="text-align: left; margin: 20px">
                          <div class="con-hline">
                            <div class="con-cell">
                              <div class="con">
                                <div class="con-hline">
                                  <div style="width: 50%; text-align: center">
                                    <img
                                      src="${pageContext.request.contextPath}/resources/images/user/rohit.PNG"
                                      class="modal-image"
                                    /><!-- image file for introduction -->
                                  </div>
                                  <div style="width: 50%; text-align: left; ">
                                    <b>Rohit Joshi</b><br/>
                                    <i>UI/UX Designer</i>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
              
                          <div class="con-hline">
                            <!-- about me section -->
                            <div class="con-cell">
                              <b> About Me</b><br />
                              <p class="text">
                                I am a computing student studing at Islington College.
                                I live in Hattiban, Lalitpur. I would like to become a 
                                professional video editor in the future.
                              </p>
                            </div>
                          </div>
              
                          <div class="con-hline">
                            <!-- middle left  -->
                            <div class="con-cell">
                              <br><b> Academic Qualification</b><br />
                              <div class="con" style="padding: 10px">
                                <div class="con-hline">
                                  <div style="padding: 10px;">
                                    <a>College:</a>
                                  </div>
                                  <div style="padding: 10px; width: 300px;">
                                    <c>St. Xavier's College<br />
                                      Lagankhel, Lalitpur</c>
                                  </div>
                                </div>
                                <div class="con-hline">
                                  <div style="padding: 10px;">
                                    <a>University:</a>
                                  </div>
                                  <div style="padding: 10px; width: 300px;">
                                    <c>Islington College<br />
                                      KamalPokhari, Kathmandu</c>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
              
                          <div class="con-hline">
                            <!-- bottom left  -->
                            <div style="padding: 0px; margin-top: -10px;">
                              <b> Interests</b><br>
                              <c> </c><c>  </c><c>  </c><c>  </c>
                            </div>
                          </div>
                        </div>
                      </div>
              
                      <div class="con-cell">
                        <!-- middle right  -->
                        <div class="con" style="text-align: left; margin-top: -40px;">
                          <div class="con-hline">
                            <div style="padding: 50px;">
                              <b> Contact Me</b><br />
                              <div class="con" style="padding: 10px">
                                <div class="con-hline">
                                  <div class="con-cell"><a>Mobile:</a></div>
                                  <div class="con-cell">
                                    <c> 9767462649</c>
                                  </div>
                                </div>
                                <div class="con-hline">
                                  <div class="con-cell">
                                    <a>Email:</a>
                                  </div>
                                  <div class="con-cell">
                                    <c>joshirohit7@gmail.com</c>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="con-hline">
                            <!-- down right -->
                            <div style="padding-left: 50px;">
                              <b>Skills</b>
                              <div class="skill">
                                <li>
                                  <a>HTML</a>
                                  <span class="bar"><span class="html"></span></span>
                                </li>
                                <li>
                                  <a>CSS</a>
                                  <span class="bar"><span class="css"></span></span>
                                </li>
                                <li>
                                  <a>PHP</a>
                                  <span class="bar"><span class="php"></span></span>
                                </li>
                                <li>
                                  <a>JAVA</a>
                                  <span class="bar"><span class="java"></span></span>
                                </li>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
        </div>
        
        <div id="modal4" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <div class="modal-header">
                  <div class="con" class="cv">
                    <!-- top left introduction heading-->
                    <div class="con-hline">
                      <div style="width: 60%">
                        <div class="con" style="text-align: left; margin: 20px">
                          <div class="con-hline">
                            <div class="con-cell">
                              <div class="con">
                                <div class="con-hline">
                                  <div style="width: 50%; text-align: center">
                                    <img
                                      src="${pageContext.request.contextPath}/resources/images/user/avatar1.png"
                                      class="modal-image"
                                    /><!-- image file for introduction -->
		                        </div>
                                  <div style="width: 50%; text-align: left; ">
                                    <b>Shrine Ghimire</b><br/>
                                    <i>Content Manager</i>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
              
                          <div class="con-hline">
                            <!-- about me section -->
                            <div class="con-cell">
                              <b> About Me</b><br />
                              <p class="text">
                                I am a computing student studing at Islington College. 
                                I live in Kapan, Kathmandu. I would like to create 
                                successful enterprise in the near future. 
                              </p>
                            </div>
                          </div>
              
                          <div class="con-hline">
                            <!-- middle left  -->
                            <div class="con-cell">
                              <br><b> Academic Qualification</b><br />
                              <div class="con" style="padding: 10px">
                                <div class="con-hline">
                                  <div style="padding: 10px;">
                                    <a>College:</a>
                                  </div>
                                  <div style="padding: 10px; width: 300px;">
                                    <c>Global College of Science<br />
                                      Mid Baneshwor, Kathmandu</c>
                                  </div>
                                </div>
                                <div class="con-hline">
                                  <div style="padding: 10px;">
                                    <a>University:</a>
                                  </div>
                                  <div style="padding: 10px; width: 300px;">
                                    <c>Islington College<br />
                                      KamalPokhari, Kathmandu</c>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
              
                          <div class="con-hline">
                            <!-- bottom left  -->
                            <div style="padding: 0px; margin-top: -10px;">
                              <b> Interests</b><br>
                              <c>Programming </c><c> Cooking </c><c> Gaming </c>
                            </div>
                          </div>
                        </div>
                      </div>
              
                      <div class="con-cell">
                        <!-- middle right  -->
                        <div class="con" style="text-align: left; margin-top: -40px;">
                          <div class="con-hline">
                            <div style="padding: 50px;">
                              <b> Contact Me</b><br />
                              <div class="con" style="padding: 10px">
                                <div class="con-hline">
                                  <div class="con-cell"><a>Mobile:</a></div>
                                  <div class="con-cell">
                                    <c> 9702894497</c>
                                  </div>
                                </div>
                                <div class="con-hline">
                                  <div class="con-cell">
                                    <a>Email:</a>
                                  </div>
                                  <div class="con-cell">
                                    <c>shrineghimire7@gmail.com</c>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="con-hline">
                            <!-- down right -->
                            <div style="padding-left: 50px;">
                              <b>Skills</b>
                              <div class="skill">
                                <li>
                                  <a>HTML & CSS</a>
                                  <span class="bar"><span class="html"></span></span>
                                </li>
                                <li>
                                  <a>C++</a>
                                  <span class="bar"><span class="c"></span></span>
                                </li>
                                <li>
                                  <a>Python</a>
                                  <span class="bar"><span class="python"></span></span>
                                </li>
                                <li>
                                  <a>JAVA</a>
                                  <span class="bar"><span class="java"></span></span>
                                </li>
                                <li>
                                  <a>JavaScript</a>
                                  <span class="bar"><span class="js"></span></span>
                                </li>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
        </div>
        

        <!-- Footer -->
        <footer>
            <div class="footer-content">
                <div class="footer-section">
                    <h3>Movieहेरम</h3>
                    <p>Your ultimate streaming destination</p>
                </div>
                <div class="footer-section">
                    <h3>Quick Links</h3>
                    <a href="#">About Us</a>
                    <a href="https://help.netflix.com/en">Contact</a>
                    <a href="termsCondition">Terms of Service</a>
                </div>
                <div class="footer-section">
                    <h3>Connect With Us</h3>
                    <div class="social-links">
                        <a href="https://www.facebook.com">Facebook</a>
                        <a href="https://www.twitter.com">Twitter</a>
                        <a href="https://www.instagram.com">Instagram</a>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2025 MovieHeram. All rights reserved.</p>
            </div>
        </footer>
    
    <script>

    document.addEventListener('DOMContentLoaded', function() {
        // Get all modal buttons
        const modalButtons = document.querySelectorAll('.card-button');
        const closeButtons = document.querySelectorAll('.close');
        
        // Add click event to each modal button
        modalButtons.forEach(button => {
            button.addEventListener('click', function() {
                const modalId = this.getAttribute('data-modal');
                document.getElementById(modalId).style.display = 'block';
            });
        });
        
        // Add click event to each close button
        closeButtons.forEach(button => {
            button.addEventListener('click', function() {
                this.closest('.modal').style.display = 'none';
            });
        });
        
        // Close modal when clicking outside
        window.addEventListener('click', function(event) {
            if (event.target.classList.contains('modal')) {
                event.target.style.display = 'none';
            }
        });
    });
    </script>

</body>
</html>