import type { NextPage } from "next";
import { useState } from "react";
import styles from "../styles/Home.module.css";

const Home: NextPage = () => {
  const [showLogin, setShowLogin] = useState(false);
  const [showSignup, setShowSignup] = useState(false);

  const handleLoginClick = () => {
    setShowSignup(false);
    setShowLogin(true);
  };

  const handleSignupClick = () => {
    setShowLogin(false);
    setShowSignup(true);
  };

  return (
    <div className={styles.container}>
      <main className={styles.main}>
        <div className={styles.logo}></div>

        <p className={styles.description}>
          Simplifiez toutes vos démarches administratives avec Doc RoadMap.
          Accédez facilement à des informations et des services pour naviguer
          dans les complexités administratives françaises.
        </p>

        <div className={styles.buttons}>
          <button onClick={handleLoginClick} className={styles.button}>
            Connexion
          </button>

          <button onClick={handleSignupClick} className={styles.button}>
            Inscription
          </button>
        </div>

        {showLogin && (
          <div className={styles.form}>
            <h2>Connexion</h2>
            <input type="email" placeholder="Email" className={styles.input} />
            <input
              type="password"
              placeholder="Mot de passe"
              className={styles.input}
            />
            <button className={styles.submitButton}>Se connecter</button>
          </div>
        )}

        {showSignup && (
          <div className={styles.form}>
            <h2>Inscription</h2>
            <input type="text" placeholder="Nom" className={styles.input} />
            <input type="email" placeholder="Email" className={styles.input} />
            <input
              type="password"
              placeholder="Mot de passe"
              className={styles.input}
            />
            <button className={styles.submitButton}>S&apos;inscrire</button>
          </div>
        )}
      </main>
    </div>
  );
};

export default Home;
