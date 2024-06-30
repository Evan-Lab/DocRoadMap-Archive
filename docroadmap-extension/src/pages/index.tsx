import type { NextPage } from "next";

const Home: NextPage = () => {
  return (
    <div className="min-h-screen flex flex-col items-center justify-center py-2">
      <main className="flex flex-col items-center justify-center w-full flex-1 px-20 text-center">
        <h1 className="text-6xl font-bold mb-8">
          Welcome to{" "}
          <a
            href="https://nextjs.org"
            className="text-red-600 hover:underline text-lg"
          >
            Next.js!
          </a>
        </h1>

        <p className="mt-3 text-2xl">
          Get started by editing{" "}
          <code className="bg-gray-200 rounded-md p-2">
            src/pages/index.tsx
          </code>
        </p>

        <div className="mt-6 flex flex-wrap items-center justify-around w-full max-w-screen-lg">
          <a
            href="https://nextjs.org/docs"
            className="p-6 mt-6 text-left border w-full md:w-5/12 lg:w-3/12 rounded-xl hover:text-blue-600 focus:text-blue-600 mx-4"
          >
            <h2 className="text-2xl font-bold">Documentation &rarr;</h2>
            <p className="mt-4 text-xl">
              Find in-depth information about Next.js features and API.
            </p>
          </a>

          <a
            href="https://nextjs.org/learn"
            className="p-6 mt-6 text-left border w-full md:w-5/12 lg:w-3/12 rounded-xl hover:text-blue-600 focus:text-blue-600 mx-4"
          >
            <h2 className="text-2xl font-bold">Learn &rarr;</h2>
            <p className="mt-4 text-xl">
              Learn about Next.js in an interactive course with quizzes!
            </p>
          </a>

          <a
            href="https://github.com/vercel/next.js/tree/canary/examples"
            className="p-6 mt-6 text-left border w-full md:w-5/12 lg:w-3/12 rounded-xl hover:text-blue-600 focus:text-blue-600 mx-4"
          >
            <h2 className="text-2xl font-bold">Examples &rarr;</h2>
            <p className="mt-4 text-xl">
              Discover and deploy boilerplate example Next.js projects.
            </p>
          </a>

          <a
            href="https://vercel.com/new?utm_source=create-next-app&utm_medium=default-template&utm_campaign=create-next-app"
            className="p-6 mt-6 text-left border w-full md:w-5/12 lg:w-3/12 rounded-xl hover:text-blue-600 focus:text-blue-600 mx-4"
          >
            <h2 className="text-2xl font-bold">Deploy &rarr;</h2>
            <p className="mt-4 text-xl">
              Instantly deploy your Next.js site to a public URL with Vercel.
            </p>
          </a>
        </div>
      </main>

      <footer className="flex items-center justify-center w-full h-24 border-t mt-8">
        <a
          href="https://vercel.com?utm_source=create-next-app&utm_medium=default-template&utm_campaign=create-next-app"
          target="_blank"
          rel="noopener noreferrer"
          className="flex items-center justify-center"
        >
          Powered by{" "}
          <span className="h-4 ml-2">
            <img
              src="/next-assets/vercel.svg"
              alt="Vercel Logo"
              width={72}
              height={16}
            />
          </span>
        </a>
      </footer>
    </div>
  );
};

export default Home;
