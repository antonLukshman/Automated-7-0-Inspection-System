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
      }`}
    >
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex justify-between h-16 items-center">
          <div className="flex-shrink-0 flex items-center">
            <Link href="/">
              <div className="flex items-center">
                <img src="/Logo.png" alt="QualiTrack" className="h-8 w-auto" />
                <span className="ml-2 text-xl font-bold text-blue-600">
                  QualiTrack
                </span>
              </div>
            </Link>
          </div>

          <div className="hidden sm:-my-px sm:ml-6 sm:flex sm:space-x-8">
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

            <button
              className="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700 transition-colors"
              onClick={handleGetStartedClick}
            >
              Get Started
            </button>
          </div>
        </div>
      </div>
    </nav>
  );
};
