import type { NextPage } from "next";

const Home: NextPage = () => {
  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-red-400 p-4">
      <h1 className="text-4xl font-bold mb-4 text-center">
        Bienvenue à DocRoadmap
      </h1>
      <h2 className="text-xl text-center text-gray-700">
        DocRoadmap est une application web qui permet de gérer les tâches de
        votre projet en toute simplicité.
      </h2>
    </div>
  );
};

export default Home;
