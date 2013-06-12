﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMain.Master" AutoEventWireup="true"
    CodeBehind="People.aspx.cs" Inherits="BigFont.People1" %>

<asp:Content ID="Content3" ContentPlaceHolderID="cphHeader" runat="server">
    <h1>We Are People Who Like Big Font</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSubNav" runat="server">
    <li><a href="#shaun"><i class="icon-chevron-right"></i>Shaun Luttin</a></li>
    <li><a href="#tony"><i class="icon-chevron-right"></i>Tony Edwards</a></li>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMainArticleSections" runat="server">
    <section id="shaun">
        <div class="row">
            <div class="span7">
                <header>
                    <h1>Shaun Luttin</h1>
                </header>
            </div>
        </div>
        <div class="row">
            <div class="span7">
                <div class="contact-card well well-small">
                    <div class="contact-card-inner">
                        <img class="img-polaroid img-rounded" src="assets-250/site/img/shaun_square_200.jpg"
                            alt="Shaun Luttin has short to medium length brown hair. He is wearing a blue pin-striped shirt and is standing, smiling, in front of a window."
                            title="Headshot of Shaun Luttin">
                    </div>
                    <div class="contact-card-inner">
                        <h3>Technology</h3>
                        <a class="multiline" href="./contact?action=email#technology">
                            <span>shaun@</span> <span>bigfont.ca</span> </a>
                        <img class="img-polaroid img-rounded" src="assets-250/site/img/shaun_contact_card_etc_1_100x75.jpg"
                            alt="Shaun is both a Microsoft Certified Technology Specialist and a Microsoft Certified Professional Developer"
                            title="Microsoft Certified Professional Developer Logo">
                        <img class="img-polaroid img-rounded" src="assets-250/site/img/shaun_contact_card_etc_2_100x75.jpg"
                            alt="" title="Microsoft Certified Technology Specialist Logo">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span7">
                <p class="lead">
                    Shaun was born and raised in Vancouver and completed post secondary education at the
                    University of British Columbia. After receiving a Bachelor of Human Kinetics in
                    2008, he sampled careers in health care, leisure administration, and academic research.
                    The latter included co-publishing a paper on Motor Learning with Dr. Nicola Hodges.
                </p>
                <p>
                    In 2010 he enrolled in an intensive software development program at the BC Institute
                    of Technology. Since graduation he has provided web development and technical support
                    services to small and medium-sized businesses. He is a Microsoft Certified Professional Developer.
                </p>
                <p>
                    In 2011 he and his wife Kathryn moved from Vancouver to Salt Spring Island. In 2012
                    Shaun decided to start BigFont.ca with two goals. The first is to assist businesses
                    in need of sophisticated
                    <abbr class="initialism" title="Information Technology">
                        IT</abbr>
                    solutions. The second is to help residents in need of home technical support.
                </p>
                <p>
                    In his spare time Shaun studies chess, practices sleight-of-hand, and is a prolific reader.
                    View his more complete vita on <a href="http://ca.linkedin.com/in/shaunluttin">LinkedIn</a> 
                    or listen in on Twitter <a href="https://twitter.com/dicshaunary">@dicshaunary</a>.
                </p>
                <p>
                    Microsoft ID: 
                    <a href="https://www.mcpvirtualbusinesscard.com/VBCServer/shaunluttin/profile">8147280</a>
                </p>
            </div>
        </div>
    </section>
    <section id="tony">
        <div class="row">
            <div class="span7">
                <header>
                    <h1>Tony Edwards</h1>
                </header>
                <div class="row">
                    <div class="span7">
                        <div class="contact-card well well-small">
                            <div class="contact-card-inner">
                                <img class="img-polaroid img-rounded" src="assets-250/site/img/tony200x200.png" title="Headshot of Tony Edwards"
                                    alt="Tony Edwards is wearing a gray and dark blue textured flat cap, thin rimmed glasses, a white t-shirt, and has black-gray hair. He is casually smiling with an astute look and is sitting in on a maroon couch.">
                            </div>
                            <div class="contact-card-inner">
                                <h3>Marketing</h3>
                                <a class="multiline" href="./contact?action=email#marketing">
                                    <span>tony@</span> <span>bigfont.ca</span> </a>
                                <img class="img-polaroid img-rounded" src="assets-250/site/img/tony_contact_card_etc_1_100x75.jpg"
                                    alt="A painting of a buffalo head." title="Buffalo Head Painting">
                                <img class="img-polaroid img-rounded" src="assets-250/site/img/tony_contact_card_etc_2_100x75.jpg"
                                    alt="A cave-art styling painting of a hunter and a herd of buffalo." title="Cave Art Buffalo Hunt">
                            </div>
                        </div>
                    </div>
                </div>
                <p class="lead">
                    Tony's career in marketing and advertising began in
                    television. He segued from that into the advertising
                    agency business where he planned strategy for a
                    large variety of clients that included packaged goods
                    marketers, international banks, real estate, and retail.
                    
                    <p>
                        Among the many notable clients Tony worked with in
                    Canada were such as J.M. Schneider out of Kitchener
                    Ontario and the introduction of Ikea into North
                    America at the beginning of 1977.
                    </p>

                <p>
                    At a later time Tony began to specialise in hands-on consumer research
                    as the foundation for my planning
                    <abbr title="Modus operandi">MO</abbr>
                    when he
                    adopted the anthropological method of ethnography
                    as his primary method in qualitative studies.
                </p>
                <p>
                    Tony's international experience spans several
                    countries in Africa in addition to Britain, where his
                    career commenced, and of course North America.
                    He is familiar with working among diverse cultures
                    and language groups. He documented arguably the
                    most influential experience of his youth in the wilds of
                    East Africa in his book, <a href="http://www.slopeofkongwahill.com/">The Slope of Kongwa Hill</a>.
                </p>
                <p>
                    You can find Tony on Twitter <a href="https://twitter.com/tsokh">
                        <abbr title="The Slope of Kongwa Hill">
                            @tsokh</abbr></a>.
                </p>
                <p>
                    Tony is available as marketing consultant to your company through the office of BigFont.
                </p>
            </div>
        </div>
    </section>
</asp:Content>
