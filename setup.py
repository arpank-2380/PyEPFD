# This file is part of PyEPFD
# Copyright (c) 2023 Arpan Kundu
# See the LICENCE.md in root directory for full license information.

from setuptools import setup, find_packages

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

#from setuptools import setup, find_packages

setup(
    name="pyepfd",
    version="1.1",
    author="Arpan Kundu",
    author_email="arpan.kundu@gmail.com",
    description="A python package for computing electron-phonon renormalizations from finite displacements",
    license='GPLv3',
    long_description=long_description,
    long_description_content_type="text/markdown",
    packages=['pyepfd'], #find_packages(),
    classifiers=[],
    install_requires=[
        'numpy', 'scipy', 'mpi4py'
        ],
)
