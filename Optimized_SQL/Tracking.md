# Tracking & Tagging

## TMS (Tag Management System)
Outil qui centralise les balises de tracking (scripts qui envoient des données à GA4, Facebook Pixel, etc.) pour pouvoir les ajouter ou modifier sans toucher au code du site à chaque fois.

## GTM (Google Tag Manager)
Le TMS gratuit de Google. Version **client-side** : les balises s'exécutent dans le navigateur de l'utilisateur (tourne en JS dans la page).

## sGTM (server-side GTM)
Même logique que GTM, mais les balises tournent sur un serveur intermédiaire (souvent un conteneur Google Cloud) plutôt que dans le navigateur.
Avantages :
- Plus robuste face aux adblockers et à l'ITP (Safari)
- Plus de contrôle/filtrage sur les données envoyées aux tiers
- Meilleure conformité RGPD

## Tagging plan (plan de marquage)
Document qui liste tous les événements à tracker (ex: `add_to_cart`, `purchase`), leurs paramètres associés (prix, quantité, ID produit), et où ils doivent être envoyés. C'est la spec que les développeurs suivent pour implémenter le tracking.

## DataLayer
Objet JavaScript présent sur la page qui stocke les données d'événements, que GTM lit pour déclencher les balises. C'est l'interface entre le site et GTM.

## DOM (Document Object Model)
Représentation structurée du HTML d'une page que JavaScript peut lire ou modifier. En tracking, "manipulation du DOM" signifie souvent écouter des clics ou lire le contenu d'éléments pour déclencher du tracking sans dataLayer dédié.

## SPA (Single Page Application)
Site qui ne recharge pas la page à chaque navigation (React, Vue, Angular). Problème pour le tracking : les outils classiques détectent un "pageview" au chargement de page — sur une SPA, il faut déclencher manuellement les pageviews/events à chaque changement de route virtuelle.

## Consent Mode v2 (Google)
Mécanisme qui ajuste le comportement de GA4/Google Ads selon que l'utilisateur a donné son consentement cookies ou non (envoi de données dégradé ou anonymisé en cas de refus).

## TCF v2 (Transparency & Consent Framework)
Standard IAB Europe pour formaliser la collecte et la transmission du consentement RGPD entre un site et ses partenaires publicitaires/techniques. La CMP (bandeau cookies) génère un "TC string" lu par les outils tiers.

## CMP (Consent Management Platform)
Outil qui gère le bandeau de consentement cookies (ex: Didomi, OneTrust, Axeptio).
