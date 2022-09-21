# Remote sensing

## Meaning and definition

\small
- Acquisition of information about an object or phenomenon without making physical contact with the object.
- Contrasts with in-situ or on-site observation.
- Commonly applied in context of acquiring large or long range object information -- earth or astronomical objects.
- Using in numerous fields,
  \begin{itemize}
  \item Geography
  \item Land surveying
  \item Agriculture
  \item Hydrology/geology/oceanology
  \item Intelligence science
  \end{itemize}

##

\small
- Makes use of satellite or aircraft based sensor, to detect signals (e.g. electromagnetic radiation) using
  \begin{itemize}
  \item passive sensing
  \item active sensing: RADAR and LiDAR (time delay between emission and return is measured, establishing the location, speed and direction of an object)
  \end{itemize}
- Ground based sensing and aerial sensing

## Application of remote sensing in agriculture

- Possible to collect data of dangerous or inaccessible areas
  - areas of forestfire
  - glacial regions
  - waterbodies
- In military, used in
  - reconissance
  - ballistic threat appraisal
- Large scale and temporal remote sensed data help detect natural hydrogeographic trends -- El nino
- Land usage and conservation status
- Green-house gas monitoring, oil spill detection

## Use of remote sensed Multispectral data

- Spectral data recording devices or images acquired that way are analyzed to obtain information about
  - vegetation cover
  - land use pattern
  - atmospheric variables
  - surface temperature and irradiation
- Various spectral bands result due to difference in wavelengths of light emitted by a body.
- Exact wavelength values depend on the particular instruments (e.g. characteristics of satellite's sensors for Earth observation, characteristics of illumination and sensors for document analysis):
  \footnotesize
  - Blue, 450–515/520 nm, is used for atmosphere and deep water imaging, and can reach depths up to 150 feet (50 m) in clear water.
  - Green, 515/520–590/600 nm, is used for imaging vegetation and deep water structures, up to 90 feet (30 m) in clear water.
  - Red, 600/630–680/690 nm, is used for imaging man-made objects, in water up to 30 feet (9 m) deep, soil, and vegetation.
  - Near infrared (NIR), 750–900 nm, is used primarily for imaging vegetation.
  - Mid-infrared (MIR), 1550–1750 nm, is used for imaging vegetation, soil moisture content, and some forest fires.
  - Far-infrared (FIR), 2080–2350 nm, is used for imaging soil, moisture, geological features, silicates, clays, and fires.
  - Thermal infrared, 10400-12500 nm, uses emitted instead of reflected radiation to image geological structures, thermal differences in water currents, fires, and for night studies.
  - Radar and related technologies are useful for mapping terrain and for detecting various objects.

##  Digital image processing

- Digital image processing is the use of a digital computer to process digital images through an algorithm
  - Allows a much wider range of algorithms to be applied to the input and avoid problems such as noise build-up
- Images are defined (generally) over two dimensions
- Purpose of early image processing was to improve the quality of the image, mostly:
  - image enhancement
  - restoration
  - encoding
  - compression
  - noise removal
- With cheaper computer hardware and faster operational speed, general-purpose computers can perform image processing with ease.
- Television channels and live broadcasts perform image processing in real-time

##

- Capturing a digital image requires an image sensor -- a metal-oxide-semiconductor technology (MOS).
  - Charged couple device (CCD)
  - NMOS active pixel sensor (NMOS-APS)
  - CMOS active pixel sensor
- Several billion JPEG images are produced each day!
- JPEG standard: Joint Photographic Experts Group, 1992
  - uses DCT for a lossy compression

## Digital image operations

- Reflection
- Scaling/transforming
- Rotation
- Shearing
- Denoising
- Filtering (high pass, low pass)
- Smoothing/blurring
- Histogram equilization
- Color switching and inversion

##

- Digital image processing allows the use of much more complex algorithms, and hence, can offer both more sophisticated performance at simple tasks, and the implementation of methods which would be impossible by analogue means.
- In particular, digital image processing is a concrete application of, and a practical technology based on:
  - Classification
  - Feature extraction
  - Multi-scale signal analysis
  - Pattern recognition
  - Projection

Some techniques which are used in digital image processing include:
  - Anisotropic diffusion
  - Hidden Markov models
  - Image editing
  - Image restoration
  - Independent component analysis
  - Linear filtering
  - Neural networks
  - Partial differential equations
  - Pixelation
  - Point feature matching
  - Principal components analysis
  - Self-organizing maps
  - Wavelets

##

- Unlike other aerial photographic and satellite image interpretation work, these multispectral images do not make it easy to identify directly the feature type by visual inspection. Hence the remote sensing data has to be classified first, followed by processing by various data enhancement techniques so as to help the user to understand the features that are present in the image.

Such classification is a complex task which involves rigorous validation of the training samples depending on the classification algorithm used. The techniques can be grouped mainly into two types.

    Supervised classification techniques
    Unsupervised classification techniques

Supervised classification makes use of training samples. Training samples are areas on the ground for which there is ground truth, that is, what is there is known. The spectral signatures of the training areas are used to search for similar signatures in the remaining pixels of the image, and we will classify accordingly. This use of training samples for classification is called supervised classification. Expert knowledge is very important in this method since the selection of the training samples and a biased selection can badly affect the accuracy of classification. Popular techniques include the maximum likelihood principle and convolutional neural network. The Maximum likelihood principle calculates the probability of a pixel belonging to a class (i.e. feature) and allots the pixel to its most probable class. Newer convolutional neural network based methods [21] account for both spatial proximity and entire spectra to determine the most likely class.

In case of unsupervised classification no prior knowledge is required for classifying the features of the image. The natural clustering or grouping of the pixel values, i.e. the gray levels of the pixels, are observed. Then a threshold is defined for adopting the number of classes in the image. The finer the threshold value, the more classes there will be. However, beyond a certain limit the same class will be represented in different classes in the sense that variation in the class is represented. After forming the clusters, ground truth validation is done to identify the class the image pixel belongs to. Thus in this unsupervised classification apriori information about the classes is not required. One of the popular methods in unsupervised classification is k-means clustering.