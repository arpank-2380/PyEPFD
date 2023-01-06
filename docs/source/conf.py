# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

import sys, os
import sphinx_rtd_theme
sys.path.insert(0,os.path.abspath('..'))

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'PyEPFD'
copyright = '2023, Arpan Kundu'
author = 'Arpan Kundu'
release = '1.0.0'
version = '1.0.0'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
            'sphinx.ext.autodoc',
            'sphinx.ext.mathjax',
            #'sphinx-mathjax-offline',
            'sphinx.ext.coverage',
            'sphinx.ext.intersphinx',
            'sphinx.ext.viewcode',
            'sphinx_rtd_theme',
            #'IPython.sphinxext.ipython_console_highlighting',
            'sphinx.ext.napoleon'
            ]

autodoc_member_order = 'bysource'

templates_path = ['_templates']

mathjax_config = {
    'TeX': {'equationNumbers': {'autoNumber': 'AMS', 'useLabelIds': True}},
}

# master toctree document
master_doc = 'index'

exclude_patterns = ['_build', '_static']


# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'sphinx_rtd_theme'
#html_favicon = 'favicon.png'
html_logo = 'pyepfd_logo.png'

html_theme_options = {
    'logo_only': True,
    'display_version': True
}

html_static_path = ['_static']
