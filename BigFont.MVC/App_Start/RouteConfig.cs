﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace BigFont.MVC {
    public class RouteConfig {
        public static void RegisterRoutes(RouteCollection routes) {

            routes.RouteExistingFiles = true; // allow routes with the same names as directories e.g. Services

            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{action}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}