import React, { useState, useEffect } from "react";
import Link from "next/link";
import { useRouter } from "next/router";
import { NavLink } from "./NavLink";

export const Navbar = () => {
  const [isScrolled, setIsScrolled] = useState(false);
  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);
  const router = useRouter();

  useEffect(() => {
    const handleScroll = () => {
      setIsScrolled(window.scrollY > 0);
    };
    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

  const handleGetStartedClick = () => {
    router.push("/get-started");
  };

  return (
    <nav
      className={`fixed w-full z-50 transition-all duration-300 ${
        isScrolled ? "bg-white shadow-lg" : "bg-transparent"
      } px-4 sm:px-6 lg:px-8`} // Ensure proper padding
    >
      <div className="max-w-7xl mx-auto flex justify-between items-center h-16">
        <div className="flex items-center space-x-4"> 
          <Link href="/">
            <div className="flex items-center space-x-2">
              <img src="/Logo.png" alt="QualiTrack" className="h-8 w-auto" />
              <span className="text-xl font-bold text-blue-600">
                QualiTrack
              </span>
            </div>
          </Link>
        </div>

        <div className="hidden sm:flex space-x-10"> 
          <NavLink href="/#features">
            <span className="text-gray-900 hover:text-blue-600">
              Features
            </span>
          </NavLink>
          <NavLink href="/#how-it-works">
            <span className="text-gray-900 hover:text-blue-600">
              How it Works
            </span>
          </NavLink>
          <NavLink href="/#testimonials">
            <span className="text-gray-900 hover:text-blue-600">
              Testimonials
            </span>
          </NavLink>
          <NavLink href="/about">
            <span className="text-gray-900 hover:text-blue-600">
              About Us
            </span>
          </NavLink>
        </div>

        <div className="hidden sm:block">
          <button
            className="bg-blue-600 text-white px-5 py-2 rounded-lg hover:bg-blue-700 transition-all"
            onClick={handleGetStartedClick}
          >
            Get Started
          </button>
        </div>
      </div>
    </nav>
  );
};
