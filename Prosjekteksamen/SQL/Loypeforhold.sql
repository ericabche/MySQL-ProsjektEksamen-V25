CREATE TABLE Loypeforhold (
  LoypeforholdID INT AUTO_INCREMENT PRIMARY KEY,
  Loypenavn VARCHAR(60) NOT NULL,
  Dato DATE NOT NULL,
  SnoForholdID INT NOT NULL,
  NivaID INT NOT NULL,
  FOREIGN KEY (SnoforholdID) REFERENCES Snoforhold(SnoforholdID),
  FOREIGN KEY (NivaID) REFERENCES BrukerNiva(NivaID)
);