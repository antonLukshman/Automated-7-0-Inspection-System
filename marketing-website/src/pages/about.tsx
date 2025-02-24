import React from "react";
import { motion } from "framer-motion";
import { Linkedin, Mail, Github } from "lucide-react";
import "../styles/globals.css";
import { Footer } from "@/components/layout/Footer";
import { Navbar } from "@/components/layout/Navbar";

const teamMembers = [
  {
    name: "Luckmali Fernando",
    role: "Group Leader & Full Stack Developer",
    image: "/api/placeholder/300/300",
    linkedin: "#",
    github: "#",
    email: "luckmali@example.com",
    bio: "Full stack developer with expertise in React and Django. Team leader with strong project management skills.",
  },
  {
    name: "Kesara Jayaweera",
    role: "Backend Developer",
    image: "/api/placeholder/300/300",
    linkedin: "#",
    github: "#",
    email: "kesara@example.com",
    bio: "Specializes in Django REST Framework and database design. Passionate about building scalable backend systems.",
  },
  {
    name: "Hassan Shamil",
    role: "ML Engineer",
    image: "/api/placeholder/300/300",
    linkedin: "#",
    github: "#",
    email: "hassan@example.com",
    bio: "Machine learning expert focused on computer vision and deep learning models.",
  },
  {
    name: "Anton Luckshman",
    role: "Frontend Developer",
    image: "/api/placeholder/300/300",
    linkedin: "#",
    github: "#",
    email: "anton@example.com",
    bio: "Frontend specialist with expertise in React and modern web technologies.",
  },
  {
    name: "Judith Nihara",
    role: "UI/UX Designer",
    image: "/api/placeholder/300/300",
    linkedin: "#",
    github: "#",
    email: "judith@example.com",
    bio: "Creative UI/UX designer focused on creating intuitive user experiences.",
  },
  {
    name: "Vanuja Nanayakkara",
    role: "QA Engineer",
    image: "/api/placeholder/300/300",
    linkedin: "#",
    github: "#",
    email: "vanuja@example.com",
    bio: "Quality assurance specialist ensuring high standards in software delivery.",
  },
];

const AboutUs = () => {
  return (
    <div className="min-h-screen bg-white">
      <Navbar />
      <motion.div
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ duration: 1 }}
        className="text-center mb-12 pt-20" // Added padding-top here
      >
        <h1 className="text-4xl tracking-tight font-extrabold text-gray-900 sm:text-5xl md:text-6xl">
          <span className="block">Meet Our Team</span>
        </h1>
        <p className="mt-3 text-base text-gray-500 sm:mt-5  sm:max-w-xl sm:mx-auto md:mt-5 md:text-xl ">
          A dedicated group of professionals revolutionizing marketing
          strategies with innovation and creativity.
        </p>
      </motion.div>

      <div className="max-w-7xl mx-auto grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-10">
        {teamMembers.map((member, index) => (
          <motion.div
            key={index}
            whileHover={{ scale: 1.05 }}
            className="bg-blue-800 rounded-xl shadow-lg p-6 flex flex-col items-center text-center transition-transform duration-300"
          >
            <img
              src={member.image}
              alt={member.name}
              className="w-32 h-32 object-cover rounded-full border-4 border-blue-500 mb-4"
            />
            <h3 className="text-2xl font-semibold">{member.name}</h3>
            <p className="text-blue-300 text-lg mb-3">{member.role}</p>
            <p className="text-blue-200 text-sm mb-4">{member.bio}</p>
            <div className="flex space-x-4">
              <a
                href={member.linkedin}
                className="text-white hover:text-blue-400 transition-colors"
              >
                <Linkedin className="h-6 w-6" />
              </a>
              <a
                href={member.github}
                className="text-white hover:text-blue-400 transition-colors"
              >
                <Github className="h-6 w-6" />
              </a>
              <a
                href={`mailto:${member.email}`}
                className="text-white hover:text-blue-400 transition-colors"
              >
                <Mail className="h-6 w-6" />
              </a>
            </div>
          </motion.div>
        ))}
      </div>
      <Footer />
    </div>
  );
};

export default AboutUs;
